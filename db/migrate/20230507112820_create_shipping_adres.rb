class CreateShippingAdres < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_adres do |t|

      t.timestamps
    end
  end
end
