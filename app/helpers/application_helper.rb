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
	@issues = github_user.api.issues
	@issues.size * 10
  end
end
