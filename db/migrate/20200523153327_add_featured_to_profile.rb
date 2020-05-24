class AddFeaturedToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :featured, :integer, default: 0
  end
end
