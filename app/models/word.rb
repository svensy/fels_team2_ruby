class Word < ActiveRecord::Base
  belongs_to :category
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
  has_many :word_answers, dependent: :destroy
end
