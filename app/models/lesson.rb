class Lesson < ApplicationRecord
  belongs_to :user

  validates :practice_field, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :target, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 500 }

  def self.search(search)
    if search
      Lesson.where(['practice_field LIKE ?', "%#{search}%"])
    else
      Lesson.all.order(created_at: :desc)
    end
  end
end
