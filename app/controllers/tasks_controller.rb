class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    if @task.errors.empty?
      render json: @task
    else
      print @task.errors
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(:name, :status, :project_id)
  end

end
