class ProjectsController < ApplicationController

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project.to_json
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    if @project.errors.empty?
      render json: @project.to_json
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
    params.require(:project).permit(:name).merge(user_id: current_user.id)
  end

end
