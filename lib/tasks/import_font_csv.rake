require 'csv'
namespace :import_font_csv do
  task :create_fonts => :environment do
    CSV.foreach("db/krfont_sample.csv", :headers => true) do |row|
      Krfont.create!(row.to_hash)
    end
  end
end