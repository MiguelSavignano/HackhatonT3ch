class SiteController < ApplicationController
  before_action :authenticate_user!
  def index
    @notices = Notice.where(city_id: current_user.city)
  end
end
