class AddPublishedAtCampaignStartAtCampaignEndAtToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :published_at, :datetime
    add_column :jobs, :campaign_start_at, :datetime
    add_column :jobs, :campaign_end_at, :datetime
  end

  def self.down
    remove_column :jobs, :campaign_end_at
    remove_column :jobs, :campaign_start_at
    remove_column :jobs, :published_at
  end
end
