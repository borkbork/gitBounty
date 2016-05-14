class HomeController < ApplicationController
  def index
  	github_authenticate!
  end
end
