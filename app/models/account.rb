class Account < ActiveRecord::Base
  has_many :receipts

  def display_name
    ref
  end
end
