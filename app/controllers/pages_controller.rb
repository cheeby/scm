class PagesController < ApplicationController
  def index
    @pages = Page.all(conditions: ['id > 0'])
  end

  def show
    @page = Page.find(params[:id])
    page_parent
  end

  def new
    @page = Page.new
    @pages = Page.all(conditions: ['parent_id=0'])
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @pages = Page.all(conditions: ['parent_id=0'])
    @page = Page.find(params[:id])
    page_parent
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end
  def page_parent
    if
      @page.parent_id > 0
      @page_parent_controller = Page.find(:first, :conditions => ['id = ?', @page.parent_id], :select => 'slug', :limit => 1)
    else
      @page_parent_controller = @page.slug
    end
  end
end
