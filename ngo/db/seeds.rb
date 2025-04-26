# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'open-uri'

# URL to the SQL file
sql_file_url = "https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/ILT-TF-200-ACACAD-20-EN/capstone-project/Countrydatadump.sql"

begin
  # Download the SQL file content
  sql_content = URI.open(sql_file_url).read
  
  # Extract the INSERT statements - this pattern looks for INSERT INTO `countrydata_final` VALUES (...);
  insert_statement = sql_content.match(/INSERT INTO `countrydata_final` VALUES (.+?);/m)
  
  if insert_statement
    # Get the values part
    values_part = insert_statement[1]
    
    # Split into individual rows (each enclosed in parentheses)
    rows = values_part.scan(/\(([^)]+)\)/)
    
    # Process each row and create a record
    rows.each do |row_values|
      # Convert the row string to an array of values
      values = row_values[0].split(',').map(&:strip)
      
      # The first value is the country name, which is in quotes
      country_name = values[0].gsub(/^'|'$/, '') # Remove surrounding quotes
      
      # Create the CountryDataFinal record
      CountryDataFinal.create!(
        name: country_name,
        mobilephones: values[1].to_f,
        mortalityunder5: values[2].to_f,
        healthexpenditurepercapita: values[3].to_f,
        healthexpenditureppercentgdp: values[4].to_f,
        population: values[5].to_f,
        populationurban: values[6].to_f,
        birthrate: values[7].to_f,
        lifeexpectancy: values[8].to_f,
        gdp: values[9].to_f
      )
    end
    
    puts "Successfully imported #{rows.count} country records from SQL file."
  else
    puts "Could not find INSERT statement in the SQL file."
  end
rescue OpenURI::HTTPError => e
  puts "Error downloading the SQL file: #{e.message}"
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end