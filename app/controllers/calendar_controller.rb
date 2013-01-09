class CalendarController < ApplicationController
  layout 'calendar'
  def index
    index_content
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events = Event.find(:all, :conditions => ['active = true'], :limit => 10)
  end

  def show
    show_content(params[:controller].dowcase)
    @event = Event.find(params[:slug])
  end
end
