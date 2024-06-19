class List < ApplicationRecord
  validates :name, presence: true
  has_many :todos
end
