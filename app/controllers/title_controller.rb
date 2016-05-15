class TitleController < ApplicationController
  before_action :set_title, only: [:show, :edit, :update, :destroy]
  def index
    @titles = Title.all.order(:lv_req)
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
  def title_params
    params.require(:title).permit(:name,:lv_req)
  end
end
