class CreateTypeOfLegalEntities < ActiveRecord::Migration
  def change
    create_table :type_of_legal_entities do |t|
      t.belongs_to :order
      t.string :title

      t.timestamps
    end
  end
end
