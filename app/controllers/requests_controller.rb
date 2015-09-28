class RequestsController < ApplicationController

  def index
    @charities = Charity.all.reverse
  end

end
