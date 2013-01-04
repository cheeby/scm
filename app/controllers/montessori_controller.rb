class MontessoriController < ApplicationController
  layout 'maria'
  def index
    index_content
    logger.debug "content is #{@content}\n\n\n\n\n\n\n"
  end

  def show
    show_content(params[:slug])
  end
end
