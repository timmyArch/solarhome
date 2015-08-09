json.array!(@consumers) do |consumer|
  json.extract! consumer, :id, :priority, :actor_id, :name, :address, :enabled, :active, :power, :switch_interval, :switched_at
  json.url consumer_url(consumer, format: :json)
end
