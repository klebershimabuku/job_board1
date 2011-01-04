class AddAdminAnnouncerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :announcer, :boolean, :default => false
  end

  def self.down
    remove_column :users, :announcer
    remove_column :users, :admin
  end
end
