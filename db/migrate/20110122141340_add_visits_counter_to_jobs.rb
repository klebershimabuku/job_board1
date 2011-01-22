class AddVisitsCounterToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :visits, :integer, :default => 0
  end

  def self.down
    remove_column :jobs, :visits
  end
end
