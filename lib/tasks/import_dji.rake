desc "Import DJI index"
task :import_dji => :environment do
  import = build_import_dji
  if import.nil?
    puts "Something is wrong."
  else
    puts "Successfull import."
  end
end

def build_import_dji
  print "Import begining.\n"
  @last_date = DjiPrice.pluck(:date).last
  file = open('https://stooq.com/q/d/l/?s=^dji&i=d').read
  csv = CSV.parse(file, :headers => true)
  csv.each do |row|
    if row['Date'].to_date <= @last_date
      puts "No new records."
    else
      DjiPrice.create(
        :date => row['Date'],
        :open => row['Open'],
        :high => row['High'],
        :low => row['Low'],
        :close => row['Close'])
      puts "#{row['Date']} create. \n"
    end
  end
end
