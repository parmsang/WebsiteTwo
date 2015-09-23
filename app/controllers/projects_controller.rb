class ProjectsController < ApplicationController

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(update_params)
      redirect_to showcase_path
    else
      flash[:notice] = @project.errors.full_messages
      redirect_to edit_project_path(@project.id)
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = 'Project successfully deleted'
    else
      flash[:notice] = 'An error occurred: project not deleted'
    end
    redirect_to showcase_path
  end

  def update_params
    params.require(:project).permit(:title, :description, :link, :image)
  end

end
