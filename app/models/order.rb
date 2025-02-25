class Order < ApplicationRecord
  enum :pay, {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }

  validates :name, :address, :email, presence: :true
  validates :pay_type, inclusion: pay.keys
end
