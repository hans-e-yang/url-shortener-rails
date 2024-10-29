class VisitsController < ApplicationController
  def show
    @url = Url.find_by alias: params[:alias]
    if @url
      redirect_to @url.body, allow_other_host: true
    else
      redirect_to urls_path
    end
  end
end
