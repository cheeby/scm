class ProgramsController < ApplicationController
  layout 'maria'
  def index
    index_content
  end

  def show
    show_content(params[:slug])
  end
end
