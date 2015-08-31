class Task < ActiveRecord::Base
  belongs_to :project
  after_save :update_project_status

  private

  def update_project_status
    count_false = self.project.tasks.select{ |task| task.status == false}.count
    self.project.update(status: true) if count_false == 0
  end
end
