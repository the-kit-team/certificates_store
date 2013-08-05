class CreateListOfWorksCategories < ActiveRecord::Migration
  def change
    create_table :list_of_works_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
