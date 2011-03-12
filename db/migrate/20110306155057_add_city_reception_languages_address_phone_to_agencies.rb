class AddCityReceptionLanguagesAddressPhoneToAgencies < ActiveRecord::Migration
  def self.up
  	add_column :agencies, :city, :string
  	add_column :agencies, :reception, :string
  	add_column :agencies, :languages, :string
  	add_column :agencies, :address, :string
  	add_column :agencies, :phone, :string
  end

  def self.down
  	remove_column :agencies, :city
  	remove_column :agencies, :reception
  	remove_column :agencies, :languages
  	remove_column :agencies, :address
  	remove_column :agencies, :phone
  end
end
