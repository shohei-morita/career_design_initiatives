require 'csv'

CSV.foreach('db/csv/conditions.csv', headers: true) do |row|
  Condition.seed(
    type: row['type'], name: row['name']
  )
end
