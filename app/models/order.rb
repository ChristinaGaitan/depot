class Order < ApplicationRecord
  enum :pay, {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }
end
