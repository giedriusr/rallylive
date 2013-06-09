Rallylive::Application.routes.draw do

  devise_for :users
  devise_scope :user do
    post '/sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
    get '/sign_in', to: 'devise/sessions#new', as: 'sign_in'
    get '/users/sign_in', to: 'devise/sessions#new', as: 'users_sign_in'
    get '/sign_up', to: 'devise/registrations#new', as: 'sign_up'
    get '/reset_password', to: 'devise/passwords#new', as: 'reset_password'
    get '/user/account', to: 'devise/registrations#edit', as: 'account'
  end
  root 'home#index'
  get '/apie_mus', to: 'home#about_us', as: 'about_us'
  get '/dalyviu_sarasas', to: 'home#participants', as: 'participants'
  get '/starto_tvarka', to: 'home#start_order', as: 'start_order'
  get '/greicio_ruozai', to: 'home#special_stages', as: 'special_stages'
  get '/saules_ralis', to: 'home#show_rally', as: 'show_rally'
  get '/kalendorius', to: 'home#calendar', as: 'calendar'
  get '/lentele', to: 'home#standings', as: 'standings'
  get '/pasitraukimai', to: 'home#retirements', as: 'retirements'
  get '/orai', to: 'home#weather', as: 'weather'

  resources :rallies do
    resources :participants, :stages, :stage_times
  end
end
