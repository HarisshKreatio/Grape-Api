Rails.application.routes.draw do
  mount Converter::Currency => '/api'
  mount Converterv2::Currency => '/api'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
