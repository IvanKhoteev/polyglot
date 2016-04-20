ActiveAdmin.setup do |config|
  # config.root_to = 'admin/dashboard#index'
  config.site_title = 'Polyglot'
  config.logout_link_path = :destroy_admin_user_session_path
  config.comments = false
  config.batch_actions = true
  config.localize_format = :long
end
