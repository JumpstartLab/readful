class AddMinimumVotesToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :minimum_votes, :integer
  end
end
