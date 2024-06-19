class Todo < ApplicationRecord
  validates :name, presence: true
  belongs_to :list

  enum category: { personal: 0, work: 1 }
end
