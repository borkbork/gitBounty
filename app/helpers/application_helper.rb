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

  def get_xp
    issues = github_user.api.issues
    xp = Hash.new
    issues.each do |issue|
      langs = github_user.api.languages(issue.repository.full_name)
      points = 100
      total_rows = 0
      langs.each do |lang, val| total_rows += val end
      p total_rows
      langs.each do |lang, val|
        xp[lang] = (val.to_f/total_rows.to_f)*points
      end
    end
    xp
  end
end
