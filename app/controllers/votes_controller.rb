class VotesController < ApplicationController
  def create
    option = Option.find(params[:option_id])
    vote = option.votes.new
    vote.save
    redirect_to poll_path(option.poll_id)
  end
end
