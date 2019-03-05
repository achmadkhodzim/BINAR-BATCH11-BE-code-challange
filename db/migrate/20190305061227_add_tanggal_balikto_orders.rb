class AddTanggalBaliktoOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders do |t|

      t.datetime :tanggal_dibalikin
      t.rename :tanggal_pinjam, :tanggal_ambil
      t.rename :tanggal_kembali, :tanggal_sampai
    end
  end
end
