class CreateDjiNlps < ActiveRecord::Migration[5.1]
  def change
    create_table :dji_nlps do |t|
      t.string :result
      t.integer :result_int

      t.timestamps
    end
  end
end
