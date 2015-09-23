class ProjectsController < ApplicationController


  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/'
    else
      flash[:notice] = @project.errors.full_messages
      render 'new'
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, :image, :link)
  end
end
