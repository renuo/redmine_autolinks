# frozen_string_literal: true

resources :projects do
  resources :autolinks, only: %i[new edit create update destroy]
end
