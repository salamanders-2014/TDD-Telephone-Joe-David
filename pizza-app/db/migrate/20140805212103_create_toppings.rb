class CreateToppings < ActiveRecord::Migration
  def change
    create_table :toppings do |t|
      t.string :name
      t.integer :required_bake_time
      t.integer :time_baked, default: 0
      t.timestamps
    end
  end
end
