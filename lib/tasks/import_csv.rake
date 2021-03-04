require 'csv'

desc 'import cities'
task cities: [:environment] do
  list = []
  CSV.foreach('db/csv/cities.csv') do |row|
    list << {
      name: row[0],
      lat: row[1],
      lon: row[2]
    }
  end
  puts 'start creating cities'

  begin
    City.create!(list)
    puts 'completed!'
  rescue ActiveModel::UnknownAttributeError
    puts 'raised error: unknown attributes'
  end
end
