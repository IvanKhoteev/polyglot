class CreatePersonalPronouns < ActiveRecord::Migration
  def change
    create_table :personal_pronouns do |t|
      t.string :ru_who
      t.string :ru_whom
      t.string :en_who
      t.string :en_whom

      t.timestamps null: false
    end
  end
end
