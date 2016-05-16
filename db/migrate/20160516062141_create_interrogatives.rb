class CreateInterrogatives < ActiveRecord::Migration
  def change
    create_table :interrogatives do |t|
      t.string :ru
      t.string :en

      t.timestamps null: false
    end
  end
end
