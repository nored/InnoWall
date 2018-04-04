json.extract! video, :id, :title, :yt_id, :location, :wall_id, :created_at, :updated_at
json.url video_url(video, format: :json)
