json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :type, :value
  json.url measurement_url(measurement, format: :json)
end
