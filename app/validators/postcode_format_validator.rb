class PostcodeFormatValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    return if value.present? && value.length == 7 && value =~ (/^[+-]?[0-9]+$/)

    record.errors[:postcode] << (options[:message] || I18n.t('errors.messages.postcode_format'))
  end
end
