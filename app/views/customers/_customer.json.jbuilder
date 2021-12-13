json.extract! customer, :id, :name, :e_mail, :address, :tel_number, :password, :password_confirmation, :created_at, :updated_at
json.url customer_url(customer, format: :json)
