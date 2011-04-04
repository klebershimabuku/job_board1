class ChangeStateIdProvinceIdToResume < ActiveRecord::Migration
  def self.up
  	rename_column :resumes, :state_id, :province_id
  end

  def self.down
  end
end
