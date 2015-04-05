class AddMonumentIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :monument_id, :integer
  end
end
