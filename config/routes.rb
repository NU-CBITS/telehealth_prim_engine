TelehealthPrimEngine::Engine.routes.draw do
  devise_scope :user do
    root to: "admins#show"
  end
  devise_for :users,
             class_name: "TelehealthPrimEngine::User",
             module: :devise,
             path: "users"

  resource :admin, only: :show
end
