class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.date :begin_date
      t.decimal :salary
      t.string :benefits
      t.string :role
      t.references :head_hunter, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
