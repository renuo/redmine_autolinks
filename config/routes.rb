# frozen_string_literal: true

resources :projects do
  resources :autolinks, except: :show
end
