ActiveAdmin.register Word do
  actions :index
  config.filters = false

  index do
    id_column
    column :word
    column :phrases do |word|
      link_to 'Word phrases', admin_word_phrases_path(word)
    end
    actions
  end

  collection_action :add_new_word, method: :get do
    render 'admin/words/add_new_word'
  end
end
