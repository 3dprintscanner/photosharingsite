class AddSetpublicToCollections2 < ActiveRecord::Migration
  def change
    add_column :collections, :setpublic, :boolean
  end
end
