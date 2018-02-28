class CreateRecipeTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |t|
      t.column(:nanme, :string)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
    end
  end
end
