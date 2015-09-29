class RequestsController < ApplicationController

  def index
    @charities = Charity.all.reverse
  end

  def show
    @charity = Charity.find(params[:id])
  end

end
