json.extract! sitedpost, :id, :content, :position, :created_at, :updated_at
json.url sitedpost_url(sitedpost, format: :json)
