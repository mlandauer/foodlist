class Account < ActiveRecord::Base
  has_many :receipts
end
