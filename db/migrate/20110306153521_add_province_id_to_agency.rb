class AddProvinceIdToAgency < ActiveRecord::Migration
  def self.up
    add_column :agencies, :province_id, :integer
  end

  def self.down
  	remove_column :agencies, :province_id
  end
end
