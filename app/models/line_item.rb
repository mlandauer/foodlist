class LineItem < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :product
end
