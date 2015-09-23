class ShowcaseController < ApplicationController

  def index
    @projects = Project.all
  end

end
