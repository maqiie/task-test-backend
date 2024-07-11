class CreateCompletedTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
