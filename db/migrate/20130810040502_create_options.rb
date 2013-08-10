class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :title
      t.text :note
      t.integer :poll_id
      t.string :url

      t.timestamps
    end
  end
end
