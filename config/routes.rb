TelehealthPrimEngine::Engine.routes.draw do
  devise_for :users, class_name: "TelehealthPrimEngine::User"

  root to: "admins#show"
end
