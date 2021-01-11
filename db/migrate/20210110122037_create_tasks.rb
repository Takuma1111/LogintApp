class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      to_table: :users
      t.string :taskname
      t.text :body

      t.timestamps
    end
  end
end
