class Modification < ActiveRecord::Base
  belongs_to :item
  belongs_to :mod
end
