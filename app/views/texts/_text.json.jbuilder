json.extract! text, :id, :title, :content, :location, :wall_id, :created_at, :updated_at
json.url text_url(text, format: :json)
