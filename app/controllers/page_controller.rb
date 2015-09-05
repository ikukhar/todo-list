class PageController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = JSON.parse Project.order('status desc, id desc').to_json(include: :tasks)
  end

end
