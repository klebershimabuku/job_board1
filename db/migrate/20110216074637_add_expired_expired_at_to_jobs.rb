class AddExpiredExpiredAtToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :expired, :boolean, :default => false
    add_column :jobs, :expired_at, :datetime
  end

  def self.down
    remove_column :jobs, :expired_at
    remove_column :jobs, :expired
  end
end
