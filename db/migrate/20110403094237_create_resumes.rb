class CreateResumes < ActiveRecord::Migration
  def self.up
    create_table :resumes do |t|
      t.integer :user_id
      t.string :name
      t.string :lastname
      t.date :birthday
      t.string :marital_status
      t.string :address
      t.string :city
      t.integer :province_id
      t.string :phone_number
      t.boolean :working
      t.boolean :possible_moving
      t.integer :children
      t.text :qualities
      t.text :notes
      t.string :gender
      t.integer :height
      t.integer :weight
      t.string :origin
      t.boolean :piercing
      t.boolean :tattoo
      t.boolean :vehicle
      t.string :japanese_level
      t.integer :hits

      t.timestamps
    end
  end

  def self.down
    drop_table :resumes
  end
end
