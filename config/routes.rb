Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'quizzes/:id/play', to: 'quizzes#play'
  post 'quizzes/:id/play', to: 'quizzes#postplay'
  resources :users
  resources :quizzes do
    resources :questions
  end
end
