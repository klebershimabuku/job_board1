class CreateDekapowers < ActiveRecord::Migration
  def self.up
    create_table :dekapowers do |t|
      t.string :title
      t.text :content
      t.string :url
      t.datetime :published
      t.datetime :updated
      t.integer :clicks

      t.timestamps
    end
  end

  def self.down
    drop_table :dekapowers
  end
end
