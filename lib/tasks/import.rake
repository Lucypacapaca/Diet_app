require 'csv'


# rake import:foods
namespace :import do
  desc "Import food data from csv"

  task foods: :environment do
    #Food.delete_all
    path = File.join Rails.root, "eiyo.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["Name"],
          protein: row["PROTEIN"],
          fat: row["FAT"],
          carbon_hydrate: row["CARBON HYDRATE"],
          kcal: row["KCAL"]

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
