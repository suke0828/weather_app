class ApplicationController < ActionController::Base
  include ApplicationHelper

  def all_prefectures
    City.all
  end
end
