class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :images, :string, array: true
  end
end
