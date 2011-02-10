class AddBusinessRequestedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :business_requested, :boolean
    add_column :users, :business_requested_at, :datetime  	
  end

  def self.down
    remove_column :users, :business_requested
    remove_column :users, :business_requested_at  	
  end
end
