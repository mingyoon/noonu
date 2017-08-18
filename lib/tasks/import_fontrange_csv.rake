require 'csv'
namespace :import_fontrange_csv do
  task :create_fontranges => :environment do
    CSV.foreach("db/fontrange_sample.csv", :headers => true) do |row|
      Fontrange.create!(row.to_hash)
    end
  end
end