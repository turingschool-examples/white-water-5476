class Recipe < ApplicationRecord
   has_many :ingredients
   validates_presence_of :name, :complexity, :genre
end