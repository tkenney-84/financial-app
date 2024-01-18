Rails.application.routes.draw do

  # Load devise routes and use custom registration controller.
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  # GET
  get 'finances/dashboard', to: 'finances#dashboard', as: 'dashboard' # This is the post-auth path for users.
  get 'finances/income'
  get 'finances/one-time-transactions'
  get 'finances/recurring-transactions'

  # POST
  post '/set_session_captcha', to: 'captcha#setSessionCaptcha'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Set the root route to the prebuilt devise login page.
  devise_scope :user do
    root to: "devise/sessions#new", as: 'sign_out'
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
