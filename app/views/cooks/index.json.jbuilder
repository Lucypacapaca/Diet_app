json.array!(@cooks) do |cook|
  json.extract! cook, :name, :kcal
  json.start cook.updated_date
  json.url cook_url(cook)
end
