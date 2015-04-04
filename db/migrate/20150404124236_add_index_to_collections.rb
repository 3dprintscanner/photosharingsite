class AddIndexToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :references, :monument
  end
end
