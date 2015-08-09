json.array!(@actors) do |actor|
  json.extract! actor, :id, :address, :active
  json.url actor_url(actor, format: :json)
end
