class SessionsController < ApplicationController
  def create
    github_authenticate!
  	if !User.where(:git_id => github_user.api.user.id).nil?
  	  user = User.new
  	  user.git_id = github_user.api.user.id
  	  user.xp = 0
  	  user.save!
  	end
    redirect_to root_url
  end

  def destroy
    github_logout
    redirect_to root_url
  end
end
