class AddCompanynameCompanywebsiteHowtoapplyToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :company_name, :string
    add_column :jobs, :company_website, :string
    add_column :jobs, :how_to_apply, :string
  end

  def self.down
    remove_column :jobs, :how_to_apply
    remove_column :jobs, :company_website
    remove_column :jobs, :company_name
  end
end
