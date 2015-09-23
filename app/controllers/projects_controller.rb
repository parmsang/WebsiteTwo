class ProjectsController < ApplicationController

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(update_params)
    redirect_to showcase_path
  end

  def update_params
    params.require(:project).permit(:title, :description, :link, :image)
  end

end
