class Order < ActiveRecord::Base
  belongs_to :type_of_certificate
  belongs_to :type_of_legal_entity
  belongs_to :status
  has_and_belongs_to_many :list_of_works_categories
end
