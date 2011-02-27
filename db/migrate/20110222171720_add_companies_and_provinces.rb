class AddCompaniesAndProvinces < ActiveRecord::Migration
  def self.up
  	create_table :companies_provinces, :id => false do |t|
  		t.integer :company_id
  		t.integer :province_id
  	end
  end

  def self.down
  	drop_table :companies_provinces
  end
end
