Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/forex", { :controller => "currencies", :action => "first_currency" })

  # dynamic routes
  get("/forex/:first_currency_symbol", { :controller => "currencies", :action => "second_currency" })
  # the result
  get("/forex/:from_currency/:to_currency", { :controller => "currencies", :action => "exchg_rate" })

end
