class Order < ActiveRecord::Base
  has_and_belongs_to_many :list_of_works_categories
  
  def self.latest
    Order.order(:updated_at).last
  end
end
