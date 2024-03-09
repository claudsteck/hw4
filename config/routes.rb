Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  #login
  get("/login", { :controller => "sessions", :action => "new" })
end
