class AddSetpublicToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :setpublic, :boolean, default: false
  end
end
