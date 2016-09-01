class ChangePhotosImage < ActiveRecord::Migration
  def down
    change_table :photos do |t|
      t.change :images, :text, limit: 4294967295, array: true, default: []
    end
  end
end
