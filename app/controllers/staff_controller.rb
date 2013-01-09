class StaffController < ApplicationController
  layout 'maria'
  def index
    index_content
    #@employees = Employee.find(:all, :conditions => ['published = true'], :order => 'name')
  end

  def show
    show_content(params[:slug])
    @employees = Employee.find(:all, :conditions => ['published = true and staff_category_name = ?', params[:slug]], :order => 'name')
    #@staff_category = StaffCagtegory.find(params[

  end
end
