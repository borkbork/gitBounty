class HomeController < ApplicationController
  before_action :require_login

  def index
  	@issues = github_user.api.issues
  end

  def require_login
  	github_authenticate!
  end

end
