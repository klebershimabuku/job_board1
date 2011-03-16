class CreatePrefectures < ActiveRecord::Migration
  def self.up
    create_table :prefectures do |t|
      t.integer :province_id
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :prefectures
  end
end
