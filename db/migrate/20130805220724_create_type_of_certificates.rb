class CreateTypeOfCertificates < ActiveRecord::Migration
  def change
    create_table :type_of_certificates do |t|
      t.string :title

      t.timestamps
    end
  end
end
