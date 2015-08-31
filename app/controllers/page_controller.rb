class PageController < ApplicationController

  def index
    @projects = JSON.parse Project.order('status desc, id desc').to_json(include: :tasks)
  end

end
