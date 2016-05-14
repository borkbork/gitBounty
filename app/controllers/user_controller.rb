class UserController < ApplicationController
  before_action :set_user
  def show
  end
private

  def set_user
    @user = github_user.api.user(params[:id])
  end
end
