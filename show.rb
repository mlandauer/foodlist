#!/usr/bin/env ruby

require "csv"

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
    p hash
    exit
  end
  line_count += 1
end
