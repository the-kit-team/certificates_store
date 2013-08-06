class CreateTypeOfLegalEntities < ActiveRecord::Migration
  def change
    create_table :type_of_legal_entities do |t|
      t.string :title

      t.timestamps
    end
  end
end
