RSpec::Matchers.define :have_item_button do |value|
  match do |page|
    page.should have_selector("input[type=submit][value='#{value.name}']")
  end

  failure_message do
    "#{value.name} button not found"
  end
end
