class Book < ApplicationRecord
  is_impressionable :counter_cache => true
  # Above automatically add the following relation
  #has_many :impressions, as: :impressionable
end
