module SelectYearMonth
  def select_year_month(date, options = {})
    field = options[:from]
    base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
    year, month = date.split(',')
    select year, from: "#{base_id}_1i"
    select month, from: "#{base_id}_2i"
  end
end
