class RemoveuserIdFromNotes < ActiveRecord::Migration
  def up
  	remove_column :notes, :userId
  end

  def down
  	add_column :notes, :user_id, :integer
  end
end
