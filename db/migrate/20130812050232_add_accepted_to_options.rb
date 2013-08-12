class AddAcceptedToOptions < ActiveRecord::Migration
  def change
    add_column :options, :accepted, :boolean, :default => false
  end
end
