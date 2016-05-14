class HomeController < ApplicationController
  def index
  	@issues = github_user.api.issues
  end
end
