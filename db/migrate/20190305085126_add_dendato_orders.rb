class AddDendatoOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders , :denda, :integer
  end
end
