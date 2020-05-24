class AddRejectionToApplyJob < ActiveRecord::Migration[6.0]
  def change
    add_column :apply_jobs, :reject_feedback, :text
    add_column :apply_jobs, :reject, :integer, default: 0
  end
end
