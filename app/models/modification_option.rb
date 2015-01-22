class ModificationOption < ActiveRecord::Base
  belongs_to :item
  belongs_to :modification

  validates :item,
    presence: true,
    uniqueness: { scope: :modification_id }

  validates_presence_of :modification

  def modification_ids
    nil
  end

  def item_ids
    nil
  end
end
