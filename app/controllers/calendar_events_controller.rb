class CalendarEventsController < ApplicationController
  def index
    @calendar_events = CalendarEvents.all
  end

  def show
    @calendar_events = CalendarEvents.find(params[:id])
  end

  def new
    @calendar_events = CalendarEvents.new
  end

  def create
    @calendar_events = CalendarEvents.new(params[:calendar_events])
    if @calendar_events.save
      redirect_to @calendar_events, :notice => "Successfully created calendar events."
    else
      render :action => 'new'
    end
  end

  def edit
    @calendar_events = CalendarEvents.find(params[:id])
  end

  def update
    @calendar_events = CalendarEvents.find(params[:id])
    if @calendar_events.update_attributes(params[:calendar_events])
      redirect_to @calendar_events, :notice  => "Successfully updated calendar events."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @calendar_events = CalendarEvents.find(params[:id])
    @calendar_events.destroy
    redirect_to calendar_events_url, :notice => "Successfully destroyed calendar events."
  end
end
