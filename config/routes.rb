Ahrlty::Application.routes.draw do
  mount StyleGuide::Engine => "/style-guide"
  root "listings#sales"

  get "sales", to: "listings#sales", format: false, as: "sales"
  get "rentals", to: "listings#rentals", format: false, as: "rentals"

  get "contact", to: "pages#contact"

  ActiveAdmin.routes(self)
  get 'listing/:code', to: "listings#show", format: false, as: "listing"

  devise_for :users,
    :path_names => { :sign_in => 'login', :sign_out => 'logout' },
    :controllers => { :omniauth_callbacks => "omniauth_callbacks" },
    :skip => [:registration]
end

