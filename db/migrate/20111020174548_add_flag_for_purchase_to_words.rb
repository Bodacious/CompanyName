class AddFlagForPurchaseToWords < ActiveRecord::Migration
  def change
    add_column :words, :flag_for_purchase, :boolean
  end
end
