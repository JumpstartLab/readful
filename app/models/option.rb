class Option < ActiveRecord::Base
  attr_accessible :note, :poll_id, :title, :url

  belongs_to :poll
  has_many :votes

  validates_uniqueness_of :title, :scope => :poll_id

  def vote_count
    votes.count
  end

  def close
    self.accepted = (votes.count >= poll.minimum_votes)
    self.save
  end
end
