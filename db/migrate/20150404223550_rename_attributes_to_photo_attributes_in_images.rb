class RenameAttributesToPhotoAttributesInImages < ActiveRecord::Migration
  def change
  	rename_column :images, :attributes, :image_attributes
  end
end
