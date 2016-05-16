class AddLessonIdentifierToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :lesson_identifier, :string, null: false
  end
end
