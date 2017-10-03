class CreateJoinTableUsersQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :quizzes do |t|
      t.index [:user_id, :quiz_id], unique: true
      t.index [:quiz_id, :user_id]
      t.integer :score
    end
  end
end
