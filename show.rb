#!/usr/bin/env ruby

require "csv"

def display_line(array)
  line = ""
  array.each do |item, width|
    line += item[0..width-1].ljust(width) + " "
  end
  puts line
end

# Loads a csv and returns a hash for each line
# Assumes the first line is the name of the column
def load_csv(file)
  line_count = 0
  headers = nil
  CSV.foreach(file) do |row|
    headers = row if line_count == 0
    if line_count > 0
      # Ignore lines with the wrong number of entries
      if headers.count == row.count
        hash = {}
        row.each_with_index do |value,i|
          hash[headers[i]] = value
        end
        yield hash
      end
    end
    line_count += 1
  end
end

line_count = 0
display_line([["Transaction", 11], ["Date", 10], ["Stock Code", 10], ["Desc", 25], ["Qty", 10], ["Total (ex gst)", 15], ["Total (inc gst)", 15]])
load_csv("data/Kat Szum sales summary.csv") do |hash|
  display_line([[hash["TransRefCode"], 11], [hash["TransDate"], 10], [hash["StockCode"], 10], [hash["StockDesc"], 25], [hash["LineQty"], 10], [hash["LineTotalExGST"], 15], [hash["LineTotalIncGST"], 15]])
  if line_count > 20
    exit
  end
  line_count += 1
end
