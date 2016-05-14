class HomeController < ApplicationController
  before_action :require_login

  def index
  end

  def require_login
  	github_authenticate!
  end

end
