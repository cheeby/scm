class CalendarController < ApplicationController
  layout 'calendar'
  def index
    index_content
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
    show_content(params[:controller].dowcase)
  end
end
