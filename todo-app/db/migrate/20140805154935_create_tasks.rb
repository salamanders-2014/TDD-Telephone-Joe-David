class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :status, default: "incomplete"
      t.belongs_to :todo
      t.timestamps
    end
  end
end
