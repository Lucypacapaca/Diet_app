require 'csv'

# rake import:foods
namespace :import do
  desc "Import food data from csv"

  task foods: :environment do
    path = File.join Rails.root, "eiyo.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          protein: row["protein"],
          fat: row["fat"],
          carbon_hydrate: row["carbon_hydrate"],
          kcal: row["kcal"]

      }
    end
    puts "start to create food data"
    begin
      Food.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end
