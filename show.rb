#!/usr/bin/env ruby

require_relative "lib/csv_reader"

def display_line(array)
  line = ""
  array.each do |item, width|
    line += item[0..width-1].ljust(width) + " "
  end
  puts line
end

line_count = 0
display_line([["Transaction", 11], ["Date", 10], ["Stock Code", 10], ["Desc", 25], ["Qty", 10], ["Total (ex gst)", 15], ["Total (inc gst)", 15]])
CsvReader.load_csv("data/Kat Szum sales summary.csv") do |hash|
  display_line([[hash["TransRefCode"], 11], [hash["TransDate"], 10], [hash["StockCode"], 10], [hash["StockDesc"], 25], [hash["LineQty"], 10], [hash["LineTotalExGST"], 15], [hash["LineTotalIncGST"], 15]])
  if line_count > 20
    exit
  end
  line_count += 1
end
