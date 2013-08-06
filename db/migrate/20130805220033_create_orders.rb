class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :type_of_certificate
      t.belongs_to :type_of_legal_entity
      t.belongs_to :status
      t.string :company
      t.string :creator_name
      t.string :registered_address
      t.string :actual_address
      t.string :address_on_english
      t.string :phone
      t.string :fax
      t.string :email
      t.string :inn
      t.string :kpp
      t.string :ogrn
      t.string :bank
      t.string :current_account
      t.string :correspondent_account
      t.string :bik
      t.string :bank_person
      t.string :auditors_names

      t.timestamps
    end
  end
end
