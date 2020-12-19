require 'nkf'

module StringNormalizer
  def normalize_as_furigana(text)
    NKF.nkf('-W -w -Z1 --katakana', text).strip if text
  end
end
