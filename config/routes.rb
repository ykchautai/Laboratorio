Rails.application.routes.draw do
  post '/buy', to: 'buy#sale'
  get '/users/:user_id/sales', to: 'sales#by_user_badly_done'
end
