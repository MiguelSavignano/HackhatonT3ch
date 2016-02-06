json.array!(@notices) do |notice|
  json.extract! notice, :id, :city_id, :title, :description, :rating
  json.url notice_url(notice, format: :json)
end
