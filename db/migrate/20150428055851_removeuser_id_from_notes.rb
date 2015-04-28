class RemoveuserIdFromNotes < ActiveRecord::Migration
  def up
  	remove_column :notes, :userId
  end

  def down
  	add_column :notes, :userId, :integer
  end
end
