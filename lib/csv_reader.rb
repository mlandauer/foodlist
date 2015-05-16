require "csv"

class CsvReader
  # Loads a csv and returns a hash for each line
  # Assumes the first line is the name of the column
  def self.load_csv(file)
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
end
