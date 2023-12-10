class Ingredient < ApplicationRecord
   validates_presence_of :name, :cost

   def self.order_by_recently_created
      order(created_at: :DESC)
   end
end