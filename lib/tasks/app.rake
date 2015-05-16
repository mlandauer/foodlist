namespace :app do
  desc "Load database from csv file"
  task :load => :environment do
    line_count = 0
    CsvReader.load_csv("data/Kat Szum sales summary.csv") do |hash|
      receipt = Receipt.find_or_create_by(code: hash["TransRefCode"], date: hash["TransDate"])
      product = Product.find_or_create_by(stock_code: hash["StockCode"], description: hash["StockDesc"])
      LineItem.find_or_create_by(receipt: receipt, product: product,
        line_no: hash["DetailNo"], quantity: hash["LineQty"], total_ex_gst: hash["LineTotalExGST"],
        total_inc_gst: hash["LineTotalIncGST"])
      if line_count > 20
        exit
      end
      line_count += 1
    end
  end
end
