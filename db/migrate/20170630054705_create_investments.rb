class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.references :user, foreign_key: true
      t.string :symbol
      t.integer :quantity
      t.float :cost
      t.datetime :purchasedate
      t.datetime :selldate
      t.boolean :status, default: true 

      t.timestamps
    end
  end
end
