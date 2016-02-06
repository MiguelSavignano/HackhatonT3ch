class SiteController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def index
    @notices = Notice.where(city_id: current_user.city)
  end
private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @site = User.find(current_user)
  end
end
