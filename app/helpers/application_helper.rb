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
  def get_closed_issues
    github_user.api.list_issues(nil, {:state => :closed})
  end

  def get_dev_level
    Rails.cache.fetch('dev_level/#{github_user.api.user.name}') do
      xp = 0
      get_levels.each do |lang, val| xp += val end
      xp
    end
  end

  def get_levels
    Rails.cache.fetch('xp/#{github_user.api.user.name}') do
      issues = get_closed_issues
      xp = Hash.new
      issues.each do |issue|
        langs = github_user.api.languages(issue.repository.full_name)
        points = (issue.closed_at - issue.created_at)/(24 * 60 * 60).to_f/3
        total_rows = 0
        langs.each do |lang, val| total_rows += val end
        langs.each do |lang, val|
          xp[lang] = (val.to_f/total_rows.to_f)*points
        end
      end
      xp
    end
  end
end
