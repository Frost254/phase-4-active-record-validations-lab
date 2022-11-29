class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum:250 }
  validates :summary, length: { maximum:250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_it_clickbait

  def is_it_clickbait
    values = [/Won't Believe/,
    /Secret/i,
    /Top \d/i,
    /Guess/i]
    if values.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
