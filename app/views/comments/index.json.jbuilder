json.array!(@comments) do |comment|
  json.extract! comment, :id, :notice_id, :text, :title, :user_id, :rating
  json.url comment_url(comment, format: :json)
end
