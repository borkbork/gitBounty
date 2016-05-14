class HomeController < ApplicationController
  def index
  	@issues = github_user.api.issues
  	@c_issues = github_user.api.list_issues(nil, {:state => :closed})
  end
end
