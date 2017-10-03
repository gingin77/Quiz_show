class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.string :correct_answer
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.integer :author

      t.timestamps
    end
    add_reference :questions, :quiz, foreign_key: true
  end
end
