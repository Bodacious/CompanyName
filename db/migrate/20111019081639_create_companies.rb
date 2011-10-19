class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :status, limit: 1, null: false
      t.integer :number, null: false
    end
  end
end
