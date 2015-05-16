class Receipt < ActiveRecord::Base
  has_many :line_items, -> { order(:line_no) }

  def total_inc_gst
    line_items.sum(:total_inc_gst)
  end
end
