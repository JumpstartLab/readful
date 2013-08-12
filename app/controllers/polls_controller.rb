class PollsController < ApplicationController

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    @poll.save
    redirect_to @poll
  end

  def show
    @poll = Poll.find(params[:id])
  end
end