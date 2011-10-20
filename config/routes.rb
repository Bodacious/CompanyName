CompaniesHouseScraper::Application.routes.draw do
  resources :words do
    member do
      put :flag
      put :unflag
    end
  end
  root to: "words#index"
end
