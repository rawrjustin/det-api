class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :amount
      t.string :creditor
      t.string :debtor

      t.timestamps
    end
  end
end
