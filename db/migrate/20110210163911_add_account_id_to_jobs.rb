class AddAccountIdToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :account_id, :integer
  end

  def self.down
    remove_column :jobs, :account_id
  end
end
