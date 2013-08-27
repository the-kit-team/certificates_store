class Order < ActiveRecord::Base
  has_and_belongs_to_many :list_of_works_categories
  belongs_to :type_of_legal_entity
  belongs_to :type_of_certificate
  belongs_to :status
  
  def self.latest
    Order.maximum(:updated_at)
  end
end
