class CreateCategoryTagTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:categories_tags) do |t|
      t.column(:category_id, :int)
      t.column(:tag_id, :int)
    end
  end
end
