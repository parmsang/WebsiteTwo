class ShowcaseController < ApplicationController

  def index
    @projects = Project.all.reverse
  end

end
