Rails.application.routes.draw do
  # get 'option_trades/index,'
  # get 'option_trades/show,'
  # get 'option_trades/create,'
  # get 'option_trades/update,'
  # get 'option_trades/destroy'

  scope '/api' do
    resources :option_trades, only: [:index, :show, :create, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
