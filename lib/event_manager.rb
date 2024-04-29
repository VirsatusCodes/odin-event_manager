# frozen_string_literal: true

require 'csv'

puts 'Event Manager Initialized!'

# contents = File.read('../event_attendees.csv')
# lines = File.readlines('../event_attendees.csv')
# array form ^

# lines = File.readlines('../event_attendees.csv')

# lines.each do |line|
# next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"

# columns = line.split(',')
# name = columns[2]
# puts name
# end

contents = CSV.open('../event_attendees.csv', headers: true, header_converters: :symbol)

def clean_zipcode(zipcode)
  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5
  # if less than 5 digits add 0s to the front until it is 5 digits long.

  zipcode.to_s.rjust(5, '0')[0..4]
end

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end
