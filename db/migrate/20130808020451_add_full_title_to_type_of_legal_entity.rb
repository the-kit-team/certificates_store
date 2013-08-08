class AddFullTitleToTypeOfLegalEntity < ActiveRecord::Migration
  def change
    add_column :type_of_legal_entities, :full_title, :string
  end
end
