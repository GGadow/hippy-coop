class CreatePurchasesTable < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer   :member_id
      t.datetime  :purchase_date
      t.string    :description
      t.decimal   :amount           , :precision => 5, :scale => 2
    end
  end
end
