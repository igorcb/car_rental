# frozen_string_literal: true

class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.references :car, null: false, foreign_key: true
      t.string :name
      t.date :date_start
      t.date :date_end
      t.decimal :price

      t.timestamps
    end
  end
end
