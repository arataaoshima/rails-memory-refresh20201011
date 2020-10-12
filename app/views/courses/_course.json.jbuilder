json.extract! course, :id, :title, :image, :created_at, :updated_at
json.url course_url(course, format: :json)
