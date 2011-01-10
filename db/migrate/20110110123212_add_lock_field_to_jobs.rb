class AddLockFieldToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :locked, :boolean, :default => false
  end

  def self.down
    remove_column :jobs, :locked
  end
end
