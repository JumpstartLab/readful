class Poll < ActiveRecord::Base
  attr_accessible :description, :title

  validates_presence_of :title, :description

  has_many :options
end
