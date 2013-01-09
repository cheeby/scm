class EmployeesController < ApplicationController
  before_filter :login_required
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @staff_categories = StaffCategory.find(:all, :conditions => ['active = true'], :order => 'name')
    logger.debug "\n\n\n\ncategories: #{@staff_categories}\n\n\n"
    
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to @employee, :notice => "Successfully created employee."
    else
      render :action => 'new'
    end
  end

  def edit
    @staff_categories = StaffCategory.find(:all, :conditions => ['active = true'], :order => 'name')
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      redirect_to @employee, :notice  => "Successfully updated employee."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_url, :notice => "Successfully destroyed employee."
  end
end
