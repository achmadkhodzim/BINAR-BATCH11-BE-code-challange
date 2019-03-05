class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :nama
      t.string :penerbit
      t.integer :stok
      t.timestamps
    end
  end
end
