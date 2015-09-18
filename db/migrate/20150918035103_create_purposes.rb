class CreatePurposes < ActiveRecord::Migration
  def change
    create_table :purposes do |t|
    	t.column :name, :string, null: false
    	t.column :description, :text, null: false
    	t.column :value, :string, null: false
    	t.column :start_date, :date, null: false
      t.column :end_date, :date, null: false
    	t.column :city, :string, null: false
      t.timestamps
    end
  end
end
