ActiveAdmin.register Phrase do
  menu parent: 'Word'
  belongs_to :word

  config.paginate = false

  permit_params :en, :ru, :word_id

  index do
    id_column
    column :ru
    column :en
    actions
  end

  form do |f|
    f.inputs Word.find(params[:word_id]).word.upcase do
      f.input :ru
      f.input :en
    end

    f.actions
  end
end
