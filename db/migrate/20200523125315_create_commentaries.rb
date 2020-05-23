class CreateCommentaries < ActiveRecord::Migration[6.0]
  def change
    create_table :commentaries do |t|
      t.string :text
      t.references :head_hunter, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
