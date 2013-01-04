class EventCategoriesController < ApplicationController
  def index
    @event_categories = EventCategory.all
  end

  def show
    @event_category = EventCategory.find(params[:id])
  end

  def new
    @event_category = EventCategory.new
  end

  def create
    @event_category = EventCategory.new(params[:event_category])
    if @event_category.save
      redirect_to @event_category, :notice => "Successfully created event category."
    else
      render :action => 'new'
    end
  end

  def edit
    @event_category = EventCategory.find(params[:id])
  end

  def update
    @event_category = EventCategory.find(params[:id])
    if @event_category.update_attributes(params[:event_category])
      redirect_to @event_category, :notice  => "Successfully updated event category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event_category = EventCategory.find(params[:id])
    @event_category.destroy
    redirect_to event_categories_url, :notice => "Successfully destroyed event category."
  end
end
