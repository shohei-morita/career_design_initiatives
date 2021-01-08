module SelectYear
  def select_year(date, options = {})
    field = options[:from]
    base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
    year = date
    select year, from: "#{base_id}_1i"
  end
end
