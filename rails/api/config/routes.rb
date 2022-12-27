Rails.application.routes.draw do
  namespace :api do
    scope '/tests' do
       post '/', controller: :tests, action: :index
    end
  end
end
