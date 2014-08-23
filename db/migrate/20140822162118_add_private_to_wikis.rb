class AddPrivateToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :private, :boolean
  end
end
