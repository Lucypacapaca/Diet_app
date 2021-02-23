json.array!(@cooks) do |cook|
  json.url cook_url(cook, format: html)
end
