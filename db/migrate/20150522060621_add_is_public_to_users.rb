class AddIsPublicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_public, :boolean, :default => false
  end
end
