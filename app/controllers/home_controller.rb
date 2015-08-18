class HomeController < ApplicationController
  before_action :weather, :bender

  def index
  end

  def weather
    @weather = Weather::Measure.search
  end

  def bender
    @bender = Bender::Api::Model.load
  end
end
