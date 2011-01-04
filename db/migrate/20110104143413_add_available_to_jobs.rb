class AddAvailableToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :available, :boolean, :default => false
  end

  def self.down
    remove_column :jobs, :available
  end
end
