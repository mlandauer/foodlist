class LineItem < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :product
end
