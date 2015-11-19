class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.string :lesson_id
      t.string :word_id
      t.string :word_answer_id

      t.timestamps null: false
    end
  end
end
