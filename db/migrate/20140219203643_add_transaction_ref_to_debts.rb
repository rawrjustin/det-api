class AddTransactionRefToDebts < ActiveRecord::Migration
  def change
    add_reference :debts, :transaction, index: true
  end
end
