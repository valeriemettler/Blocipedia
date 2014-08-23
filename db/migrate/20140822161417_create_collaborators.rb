class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :wiki, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
