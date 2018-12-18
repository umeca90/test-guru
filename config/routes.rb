Rails.application.routes.draw do
  root   'static_pages#home'
  get  '/about',            to: 'static_pages#about'
  get  '/about_author',     to: 'static_pages#about_author'
end
