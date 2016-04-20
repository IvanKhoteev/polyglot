ActiveAdmin.register Phrase do
  menu parent: 'Word'
  belongs_to :word

  index do
    id_column
    column :ru
    column :en
    actions
  end
end
