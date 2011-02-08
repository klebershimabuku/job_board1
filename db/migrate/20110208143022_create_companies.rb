class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.text :details
      t.string :homepage
      t.string :twitter
      t.string :facebook
      t.string :email
      t.integer :visits

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
