json.extract! sheet_link, :id, :title, :url, :type, :lecture_id, :created_at, :updated_at
json.url sheet_link_url(sheet_link, format: :json)
