class StaffCategoriesController < ApplicationController
  def index
    @staff_categories = StaffCategory.all
  end

  def show
    @staff_category = StaffCategory.find(params[:id])
  end

  def new
    @staff_category = StaffCategory.new
  end

  def create
    @staff_category = StaffCategory.new(params[:staff_category])
    if @staff_category.save
      redirect_to @staff_category, :notice => "Successfully created staff category."
    else
      render :action => 'new'
    end
  end

  def edit
    @staff_category = StaffCategory.find(params[:id])
  end

  def update
    @staff_category = StaffCategory.find(params[:id])
    if @staff_category.update_attributes(params[:staff_category])
      redirect_to @staff_category, :notice  => "Successfully updated staff category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @staff_category = StaffCategory.find(params[:id])
    @staff_category.destroy
    redirect_to staff_categories_url, :notice => "Successfully destroyed staff category."
  end
end
