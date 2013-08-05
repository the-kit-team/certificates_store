json.array!(@orders) do |order|
  json.extract! order, :company, :creator_name, :registered_address, :actual_address, :address_on_english, :phone, :fax, :email, :inn, :kpp, :ogrn, :bank, :current_account, :correspondent_account, :bik, :bank_person, :auditors_names
  json.url order_url(order, format: :json)
end
