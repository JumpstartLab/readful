class Option < ActiveRecord::Base
  attr_accessible :note, :poll_id, :title, :url

  belongs_to :poll
end
