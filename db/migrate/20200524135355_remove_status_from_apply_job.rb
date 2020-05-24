class RemoveStatusFromApplyJob < ActiveRecord::Migration[6.0]
  def change
    remove_column :apply_jobs, :status, :string
  end
end
