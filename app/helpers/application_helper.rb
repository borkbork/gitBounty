module ApplicationHelper
  def current_user_local
	   User.where(:git_id => current_user.id).first
  end
  def current_user
  	if github_authenticated?
  	  @user = github_user.api.user
  	end
    @user
  end

  def get_title(lang, lvl)
    Title.where("lv_req <= '#{lvl}' AND lang = '#{lang.downcase}'").order(lv_req: :desc).first
  end

  def get_closed_issues
    github_user.api.list_issues(nil, {:state => :closed})
  end

  def get_dev_level
    Rails.cache.fetch('dev_level/' + github_user.api.user.login) do
      lv = 0
      get_levels.each do |lang, val| lv += val end
      lv
    end
  end
  def get_xp
    Rails.cache.fetch('xp/' + github_user.api.user.login) do
      issues = get_closed_issues
      xp = Hash.new
      issues.each do |issue|
        langs = get_langs_of_repo(issue.repository.full_name)
        points = 20*Math.sqrt((issue.closed_at - issue.created_at)/(24 * 60 * 60) + 5) - 40
        total_rows = 0
        langs.each do |lang, val| total_rows += val end
        langs.each do |lang, val|
          xp[lang] = (val.to_f/total_rows.to_f)*points
        end
      end
      xp
    end
  end
  def get_levels
    Rails.cache.fetch('levels/' + github_user.api.user.login) do
      level = Hash.new
      get_xp.each do |lang, val|
        level[lang] = (val.to_f/3.0)**0.55
      end
      level
    end
  end
  def get_langs_of_repo(id)
    Rails.cache.fetch('repo/' + id) do
      github_user.api.languages(id)
    end
  end
end
