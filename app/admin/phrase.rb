ActiveAdmin.register Phrase do
  menu parent: 'Word'
  belongs_to :word

  config.paginate = false

  permit_params :en, :ru, :word_id, :lesson_identifier

  index do
    id_column
    column :ru
    column :en
    column :lesson_identifier
    actions
  end

  form do |f|
    f.inputs Word.find(params[:word_id]).word.upcase do
      f.input :ru
      f.input :en
      f.input :lesson_identifier,
              as: :select,
              collection: Phrase.pluck(:lesson_identifier).uniq
    end

    f.actions
  end

  filter :lesson_identifier,
         as: :select,
         collection: Phrase.pluck(:lesson_identifier).uniq
end
