class CreatePlanes < ActiveRecord::Migration[5.0]
  def change
    create_table :planes do |t|
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
