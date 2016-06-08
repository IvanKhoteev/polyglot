class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name_ru, null: false, unique: true
      t.string :name_en, null: false
      t.string :pretext_ru, null: false
      t.string :pretext_en, null: false

      t.timestamps null: false
    end
  end
end
