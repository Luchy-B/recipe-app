# frozen_string_literal: true

class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :unit
      t.string :pric

      t.timestamps
    end
  end
end
