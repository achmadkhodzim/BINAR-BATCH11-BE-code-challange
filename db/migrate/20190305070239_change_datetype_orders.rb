class ChangeDatetypeOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders do |t|
      t.change :tanggal_dibalikin, :date
      t.change :tanggal_ambil, :date
      t.change :tanggal_sampai, :date
    end
  end
end
