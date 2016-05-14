module ApplicationHelper
  def current_user_local
	User.where(:git_id => github_user.api.user.id).first
  end

  def current_user
	if github_user
	  github_user.api.user
	else
	  nil
	end
  end
end
