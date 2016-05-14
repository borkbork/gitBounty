class RepoController < ApplicationController
  def list
    @repos = github_user.api.repos(params[:id])
    @type = params[:type]
    @name = params[:id]
  end

  def show
    repo = github_user.api.repos(params[:id]).select{|repo| repo.name = params[:repo_id]}.first
    @issues = repo.list_issues
  end
end
