class List < ApplicationRecord
  validates :name, presence: true
  has_many :todos

  include RankedModel
  ranks :row_order
end
