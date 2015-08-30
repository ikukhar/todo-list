class ProjectsController < ApplicationController

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: (JSON.parse @project.to_json(include: :tasks))
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    if @project.errors.empty?
      render json: (JSON.parse @project.to_json(include: :tasks))
    else
      render json: @project.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    head :no_content
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
