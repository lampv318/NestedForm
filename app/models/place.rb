class Place < ApplicationRecord
  has_many :addresses, dependent: :destroy
end
