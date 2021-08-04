# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.boolean :rented
      t.string :url_image

      t.timestamps
    end
  end
end
