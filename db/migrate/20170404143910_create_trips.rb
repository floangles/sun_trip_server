class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.references :group, foreign_key: true
      t.string :destination

      t.timestamps
    end
  end
end
