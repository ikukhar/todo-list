class PageController < ApplicationController

  def index
    @projects = JSON.parse Project.all.to_json(include: :tasks)
  end

end
