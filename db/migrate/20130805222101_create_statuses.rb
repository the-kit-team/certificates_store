class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.belongs_to :order
      t.string :title

      t.timestamps
    end
  end
end
