module BoxHelper
  def check_modification_box(modification)
    find(:css, "#modification_option_modification_ids_#{modification.id}").set(true)
  end

  def check_item_box(item)
    find(:css, "#modification_option_item_ids_#{item.id}").set(true)
  end
end
