class List < ApplicationRecord
  validates :name, presence: true
  has_many :todos

  enum color: { neutral: 0, green: 1, emerald: 2, red: 3, yellow: 4, orange: 5, blue: 6, sky: 7 }

  include RankedModel
  ranks :row_order
end
