class TitleController < ApplicationController
  before_action :set_title, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_admin

  def index
    @titles = Title.all.order(:lv_req)
    @langs = Set.new
    @titles.each do |title|
      @langs.add(title.lang)
    end
  end

  def lang
    @titles = Title.where("lang = '#{params[:lang]}'").order(:lv_req)
  end

  def new
    @title = Title.new
  end
  def create
    @title = Title.create(title_params)
    if @title.save
      redirect_to title_index_url , notice: "#{@title.name} saved"
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @title.update(title_params)
      redirect_to title_index_url, notice: "#{@title.name} updated"
    else
      render :edit
    end
  end
  def destroy
    @title.destroy
    redirect_to title_index_url, notice: "#{@title.name} removed"
  end
private
  def set_title
    @title = Title.find(params[:id])
  end
  def ensure_admin
    if github_user.api.organization_members('borkbork').any? { |e| e.login == github_user.api.user.login}
      true
    else
      redirect_to root_url
    end
  end
  def title_params
    params.require(:title).permit(:name,:lv_req,:lang)
  end
end
