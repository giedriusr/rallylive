Rallylive::Application.routes.draw do

  root 'home#index'
  get '/apie_mus', to: 'home#about_us', as: 'about_us'
end
