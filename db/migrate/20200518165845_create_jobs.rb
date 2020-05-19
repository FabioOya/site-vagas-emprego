class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :skills
      t.decimal :salary
      t.string :job_level
      t.date :end_date
      t.string :location
      t.references :head_hunter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
