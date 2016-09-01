class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :images, :text, array: true
  end
end
