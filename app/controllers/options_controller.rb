class OptionsController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
    @option = @poll.options.new
  end

  def create
    poll = Poll.find(params[:poll_id])
    option = poll.options.new(params[:option])
    option.save
    redirect_to poll
  end
end
