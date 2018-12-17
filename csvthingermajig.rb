require 'csv'
require_relative 'isbn_master.rb'
def read(file)
	arr1 = Array.new
	arr = CSV.read(file, 'r')
	arr.each do |row|
		row = row.to_s.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").gsub("\]", "").gsub("\[", "").gsub("\""," ")
			if row.length == 13
				arr1.push([row, checkthirteen(numberlengththirteen(row), row)])
			else 
				arr1.push([row, checkten(row)])
			end
		end
		CSV.open("result.csv", 'wb') do |csv|
			arr1.each do |v|
				csv << v
			end
		end
end