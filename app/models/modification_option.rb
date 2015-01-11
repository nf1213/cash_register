class ModificationOption < ActiveRecord::Base
  belongs_to :item
  belongs_to :modification
end
