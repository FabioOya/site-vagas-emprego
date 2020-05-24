class RemoveRejectFromApplyJob < ActiveRecord::Migration[6.0]
  def change
    remove_column :apply_jobs, :reject, :integer
  end
end
