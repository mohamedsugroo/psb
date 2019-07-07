json.extract! app, :id, :name, :access_token, :user_id, :uidn, :app_type, :approved, :pending_approval, :active, :suspended, :soft_delete, :created_at, :updated_at
json.url app_url(app, format: :json)
