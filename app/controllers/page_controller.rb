class PageController < ApplicationController

  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project
    else
      render json: @record.errorsi, status: :unprocessable_entity
    end
  end

  def destroy_project
    @project = Project.find(params[:id])
    @project.destroy
    head :no_content
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
