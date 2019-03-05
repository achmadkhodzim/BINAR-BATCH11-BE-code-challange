class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :tanggal_pinjam
      t.datetime :tanggal_kembali

      t.timestamps
    end
  end
end
