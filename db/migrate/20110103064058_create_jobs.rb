class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
