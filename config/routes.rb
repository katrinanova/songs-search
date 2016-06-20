Rails.application.routes.draw do
  root :to => "searches#home"
  get 'search_results' => "searches#search"
end
