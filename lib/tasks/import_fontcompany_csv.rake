require 'csv'
namespace :import_fontcompany_csv do
  task :create_fontcompanies => :environment do
    CSV.foreach("db/fontcompany_sample.csv", :headers => true) do |row|
      Fontcompany.create!(row.to_hash)
    end
  end
end