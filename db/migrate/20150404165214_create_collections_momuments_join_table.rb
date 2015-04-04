class CreateCollectionsMomumentsJoinTable < ActiveRecord::Migration
  def change
  	create_table :collections_monuments, :id => false do |t|
  		t.references :collection, index: true
  		t.references :monument, index: true
  	end
  end
end
