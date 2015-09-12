class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  def to_json
    super(include: :tasks)
  end
end
