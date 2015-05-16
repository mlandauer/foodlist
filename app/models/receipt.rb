class Receipt < ActiveRecord::Base
  has_many :line_items, -> { order(:line_no) }
end
