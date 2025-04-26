json.extract! country_data_final, :id, :name, :mobilephones, :mortalityunder5, :healthexpenditurepercapita, :healthexpenditureppercentgdp, :population, :populationurban, :birthrate, :lifeexpectancy, :gdp, :created_at, :updated_at
json.url country_data_final_url(country_data_final, format: :json)
