class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.integer :author

      t.timestamps
    end
  end
end
