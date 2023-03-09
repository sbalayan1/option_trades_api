Rails.application.routes.draw do
  # get '/option_trades', to: 'option_trades#index'
  get '/', to: 'option_trades#index'

  scope '/api' do

    #handles requests to the /api/
    get '/', to: 'option_trades#index'
    resources :option_trades, only: [:index, :show, :create, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
