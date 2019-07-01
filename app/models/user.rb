class User < ApplicationRecord
  has_many :clock_events
end
