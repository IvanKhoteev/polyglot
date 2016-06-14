ActiveAdmin.register Dictionary do
  actions :all
  config.filters = false

  permit_params :en, :ru, :status

  index do
    id_column
    column :en
    column :ru
    column :status
    actions
  end

  form do |f|
    f.inputs do
      f.input :en
      f.input :ru
      f.input :status,
              as: :select, allow_nil: false, include_blank: false,
              collection: Dictionary::STATUSES
    end
    f.actions
  end
end
