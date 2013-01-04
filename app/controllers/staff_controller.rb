class StaffController < ApplicationController
  layout 'maria'
  def index
    index_content
    @employees = Employee.where('published = true')
  end

  def show
    show_content(params[:slug])
  end
end
