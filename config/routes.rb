Rails.application.routes.draw do
  # Status page
  get '/status', to: 'status#check'

  # Error handlers
  match '/400', via: :all, to: 'errors#bad_request'
  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessible_entity'
  match '/500', via: :all, to: 'errors#internal_server_error'
end
