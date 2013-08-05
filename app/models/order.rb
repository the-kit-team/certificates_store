class Order < ActiveRecord::Base
  has_one :type_of_certificate
  has_one :type_of_legal_entity
  has_one :status
  has_and_belongs_to_many :list_of_works_categories
end
