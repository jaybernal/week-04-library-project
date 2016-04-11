json.array!(@some_models) do |some_model|
  json.extract! some_model, :id, :name
  json.url some_model_url(some_model, format: :json)
end
