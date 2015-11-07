class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.string :lesson_id
      t.string :word_id
      t.references :lesson, index: true, foreign_key: true
      t.references :word
      t.references :word_answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
