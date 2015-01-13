class ModificationOption < ActiveRecord::Base
  belongs_to :item
  belongs_to :modification

  def modification_ids
    nil
  end
end
