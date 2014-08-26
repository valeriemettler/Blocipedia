class AddSlugToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :slug, :string
    add_index :wikis, :slug
  end
end
