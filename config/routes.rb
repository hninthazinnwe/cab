Rails.application.routes.draw do

  # resources :cab,params: :id, only: %i[list new show create update destroy edit download]

  get 'cab/list'
  get 'cab/new'
  post 'cab/create'
  patch 'cab/update'
  get 'cab/list'
  get 'cab/show'
  get 'cab/edit'
  get 'cab/delete'
  get 'cab/download'
end
