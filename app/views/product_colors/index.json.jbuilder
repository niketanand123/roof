json.array!(@product_colors) do |product_color|
  json.extract! product_color, :id, :product_color
  json.url product_color_url(product_color, format: :json)
end
