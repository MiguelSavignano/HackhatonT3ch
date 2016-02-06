class SiteController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:locate].nil?
      @notices = Notice.where(locate: params[:locate])
    else
      @notices = Notice.where(locate: current_user.locate)
    end
  end
end
