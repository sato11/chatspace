class DevisePresenter < FormPresenter
  def text_field_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m.div(class: 'field-label') { m << label(name, label_text) }
      m.div(class: 'field-input') { m << text_field(name, options) }
    end
  end

  def password_field_block(name, label_text, options = {})
    markup(:div, class: 'field') do |m|
      m.div(class: 'field-label') do
        m << label(name, label_text)
        m.i(options[:message])
      end
      m.div(class: 'field-input') { m << password_field(name, options) }
    end
  end
end
