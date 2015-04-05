class DropTableCollections < ActiveRecord::Migration
  def change
  	drop_table :collections

  	create_table :collections do |t|
  		t.string :name
  	end
  end
end
