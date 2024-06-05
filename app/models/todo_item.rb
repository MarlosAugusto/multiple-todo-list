class TodoItem < ApplicationRecord
  enum type: {
    personal: 0,
    professional: 1,
  }
  enum status: {
    incomplete: 0,
    complete: 1,
    abandoned: 2 
  }
  has_rich_text :title

  validates :title, presence: true
  validates :abandonment_reason, presence: true, if: Proc.new { |t| t.status == 2}
end
