class AddOpenStatusToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :open, :boolean, :default => true
  end
end
