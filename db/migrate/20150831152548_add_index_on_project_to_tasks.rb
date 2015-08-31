class AddIndexOnProjectToTasks < ActiveRecord::Migration
  def change
    add_index :tasks, :project_id
  end
end
