class CreateApplyJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :apply_jobs do |t|
      t.string :status, default: 0 
      t.string :reason
      t.references :job, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
