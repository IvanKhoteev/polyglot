class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.references :word, index: true, foreign_key: true
      t.string :ru
      t.string :en

      t.timestamps null: false
    end
  end
end
