class Todo < ApplicationRecord
  enum category: { personal: 0, work: 1 }
end
