class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :nama
      t.timestamps
    end
    add_reference :books, :category, foreign_key: true
  end
end
