class TodoItem < ApplicationRecord
  enum todo_item_type: {
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
  validates :abandonment_reason, presence: true, if: Proc.new { |t| t.status == "abandoned" }

  scope :sorted, -> {
    where(status: "incomplete")
    .where("deadline >= ? or deadline IS NULL", Date.today)
    .order(arel_table[:deadline].asc.nulls_last)
  }
  scope :incomplete, -> { where(status: "incomplete") }
  scope :complete, -> { where(status: "complete") }
  scope :abandoned, -> { where(status: "abandoned") }
  scope :expired, -> { where.not(deadline: nil).where("deadline < ?", Date.today) }

  scope :personal, -> { where(todo_item_type: "personal") }
  scope :professional, -> { where(todo_item_type: "professional") }

  #todo_item_type
  def personal?
    todo_item_type == "personal"
  end
  def professional?
    todo_item_type == "professional"
  end

  #status
  def expired?
    deadline < Date.today && !completed?
  end
  def completed?
    status == "complete"
  end
  def incompleted?
    status == "incomplete"
  end
  def abandoned?
    status == "abandoned"
  end
end
