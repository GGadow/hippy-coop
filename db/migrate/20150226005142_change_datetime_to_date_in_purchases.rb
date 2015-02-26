class ChangeDatetimeToDateInPurchases < ActiveRecord::Migration
  def change
    change_column :purchases, :purchase_date, :date
  end
end
