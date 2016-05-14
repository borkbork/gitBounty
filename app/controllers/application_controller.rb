class ApplicationController < ActionController::Base
  require 'net/http'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def get_repo_from_org(org)

  end

  def get_issues_from_repo_in_org(org, repo)

  end


end
