class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    "#{sprintf('%.2f', (@builder.text_field(attribute_name, merged_input_options)))}".html_safe
  end
end
