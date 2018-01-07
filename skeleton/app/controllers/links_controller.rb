class LinksController < ApplicationController
  before_action :require_logged_in

  def index
    render :index
  end

  def new
    if logged_in?
      render :new
    else
      redirect_to new_session_url
    end
  end

  def create

    @link = Link.new(link_params)
    # @link.user = current_user
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] ='invalid stuff'
      render :new
    end

  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def edit
    @link = current_user.links.find(params[:id])
    render :edit
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update(link_params)
      redirect_to link_url
    else
      # nothing happens when try to edit different user
    end
  end

  private
  def link_params
    params.require(:link).permit(:url, :title)
  end
end
