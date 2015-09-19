json.array!(@addresses) do |address|
  json.extract! address, :id, :name, :companyName, :address1, :address2, :country, :state, :city, :zip_code
  json.url address_url(address, format: :json)
end
