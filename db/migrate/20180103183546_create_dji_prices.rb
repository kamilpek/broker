class CreateDjiPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :dji_prices do |t|
      t.date :date
      t.float :open
      t.float :high
      t.float :low
      t.float :close

      t.timestamps
    end
  end
end
