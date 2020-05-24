class AddRejectedToApplyJob < ActiveRecord::Migration[6.0]
  def change
    add_column :apply_jobs, :rejected, :integer, default: 0
  end
end
