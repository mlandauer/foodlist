#!/usr/bin/env ruby

require "csv"

def display_line(array)
  line = ""
  array.each do |item, width|
    line += item[0..width-1].ljust(width) + " "
  end
  puts line
end

line_count = 0
headers = nil
CSV.foreach("data/Kat Szum sales summary.csv") do |row|
  headers = row if line_count == 0
  if line_count > 0
    # Munge those two arrays into a hash
    raise unless headers.count == row.count
    hash = {}
    row.each_with_index do |value,i|
      hash[headers[i]] = value
    end
    #p hash
    display_line([["Transaction", 10], ["Date", 10], ["Stock Code", 10], ["Desc", 25], ["Qty", 10], ["Total (ex gst)", 15], ["Total (inc gst)", 15]])
    display_line([[hash["TransRefCode"], 10], [hash["TransDate"], 10], [hash["StockCode"], 10], [hash["StockDesc"], 25], [hash["LineQty"], 10], [hash["LineTotalExGST"], 15], [hash["LineTotalIncGST"], 15]])
    exit
  end
  line_count += 1
end
