class Poll < ActiveRecord::Base
  attr_accessible :description, :title, :minimum_votes

  validates_presence_of :title, :description

  has_many :options

  def close
    self.open = false
    self.save
  end

  def closed?
    !open
  end
end
