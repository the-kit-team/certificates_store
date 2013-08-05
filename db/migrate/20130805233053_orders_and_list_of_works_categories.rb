class OrdersAndListOfWorksCategories < ActiveRecord::Migration
  def change
    create_table :orders_list_of_works_categories do |t|
      t.belongs_to :order
      t.belongs_to :list_of_works_category
    end
  end
end
