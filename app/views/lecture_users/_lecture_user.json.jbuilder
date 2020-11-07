json.extract! lecture_user, :id, :user_id, :lecture_id, :created_at, :updated_at
json.url lecture_user_url(lecture_user, format: :json)
