class AddNameAndAttributesAndDescriptionToImage < ActiveRecord::Migration
  def change
  	change_table(:images) do |t|
  		t.string :name
  		t.text :description
  		t.string :attributes
  	end
  end
end
