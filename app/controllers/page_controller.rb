class PageController < ApplicationController

  def index
    @projects = JSON.parse Project.order('status, id desc').to_json(include: :tasks)
  end

end
