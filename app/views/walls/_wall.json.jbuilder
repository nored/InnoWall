json.extract! wall, :id, :url, :delete_after, :allow_pictures, :allow_videos, :allow_text, :restrict_location, :created_at, :updated_at
json.url wall_url(wall, format: :json)
