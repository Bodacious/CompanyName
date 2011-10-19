class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :human
      t.string :computer
      t.boolean :shortlist, default: nil
      t.boolean :domain_available, default: nil
    end
    
    add_index :words, :human
    add_index :words, :computer
    
    
  end
end
