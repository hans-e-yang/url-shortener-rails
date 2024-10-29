class UrlsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_url, only: %i[show update destroy]

  def index
    @urls = current_user.urls
  end

  def new
    @url = Url.new
  end

  def show
  end

  def create
    @url = Url.new(url_params)
    @url.user = current_user

    if @url.save
      redirect_to urls_path, notice: "Successfully shortened a new url"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @url.update(url_params)
      redirect_to @url, notice: "Successfully edited your url"
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @url.delete
    redirect_to urls_path
  end

  private

  def find_url
    begin
      @url = current_user.urls.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to urls_path, alert: "Url not found"
    rescue
      redirect_to urls_path, alert: "Unknown error"
    end
  end

  def url_params
    params.require(:url).permit(:body, :alias)
  end
end
