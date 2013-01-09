class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery


  def index_content
    @content = Page.find_by_name(params[:controller].downcase)

    @about_children = Page.all(:conditions => ['published = true and parent_id=?', 3], :select => 'id, name, slug')
    @maria_children = Page.all(:conditions => ['published = true and parent_id=?', 5], :select => 'id, name, slug')
    @programs_children = Page.all(:conditions => ['published = true and parent_id=?', 6], :select => 'id, name, slug')
    @admissions_children = Page.all(:conditions => ['published = true and parent_id=?', 8], :select => 'id, name, slug')
    @staff_categories = StaffCategory.find(:all, :conditions => ['active = true'], :order => 'name')

    current_year

  end
  
  def show_content(id)
    @content = Page.find(id)
    logger.debug "\n\n\n\n content is #{@content}\n\n\n\n"

    @about_children = Page.all(:conditions => ['published = true and parent_id=?', 3])
    @maria_children = Page.all(:conditions => ['published = true and parent_id=?', 5])
    @programs_children = Page.all(:conditions => ['published = true and parent_id=?', 6])
    @admissions_children = Page.all(:conditions => ['published = true and parent_id=?', 8])
    @staff_categories = StaffCategory.find(:all, :conditions => ['active = true'], :order => 'name')

    current_year
  end

  def current_year
    now = Time.now
    @year = now.year
  end
end
