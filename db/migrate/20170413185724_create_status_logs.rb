class CreateStatusLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :status_logs do |t|
      t.integer :status
      t.references :plane, foreign_key: true

      t.timestamps
    end
  end
end
