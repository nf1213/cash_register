class Attribution < ActiveRecord::Base
  belongs_to :item
  belongs_to :attribute
end
