json.extract! contact, :id, :title, :content, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
