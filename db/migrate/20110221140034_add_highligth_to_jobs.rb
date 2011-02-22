class AddHighligthToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :highlight, :boolean
  end

  def self.down
    remove_column :jobs, :highlight
  end
end
