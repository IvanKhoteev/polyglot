class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :en
      t.string :ru
      t.string :status

      t.timestamps null: false
    end
  end
end
