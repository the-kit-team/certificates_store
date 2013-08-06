class ListOfWorksCategoriesAndOrders < ActiveRecord::Migration
  def change
    create_table :list_of_works_categories_orders do |t|
      t.belongs_to :order
      t.belongs_to :list_of_works_category
    end
  end
end
