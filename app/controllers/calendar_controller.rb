class CalendarController < ApplicationController
  layout 'calendar'
  def index
    index_content
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    logger.debug "\n\n\n date is #{@date}\n\n\n"
  end

  def show
    show_content(params[:controller].dowcase)
  end
end
