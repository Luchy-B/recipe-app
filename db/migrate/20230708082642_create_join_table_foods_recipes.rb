class CreateJoinTableFoodsRecipes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :foods, :recipes do |t|
      t.references :food, foreign_key: true
      t.references :recipe, foreign_key: true
    end
  end
end
