class RemoveDekapower < ActiveRecord::Migration
  def self.up
    drop_table :dekapowers
  end

  def self.down
  end
end
