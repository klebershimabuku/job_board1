class ProvincesResumes < ActiveRecord::Migration
  def self.up
  	create_table :provinces_resumes, :id => false do |t|
  		t.integer :province_id
  		t.integer :resume_id
  	end
  end

  def self.down
  	drop_table :provinces_resumes
  end
end
