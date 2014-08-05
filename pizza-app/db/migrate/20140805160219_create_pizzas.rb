class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :description
      t.integer :time_baked
      t.timestamps
    end
  end
end
