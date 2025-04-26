class CreateCountryDataFinals < ActiveRecord::Migration[8.0]
  def change
    create_table :country_data_finals do |t|
      t.text :name
      t.float :mobilephones
      t.float :mortalityunder5
      t.float :healthexpenditurepercapita
      t.float :healthexpenditureppercentgdp
      t.float :population
      t.float :populationurban
      t.float :birthrate
      t.float :lifeexpectancy
      t.float :gdp

      t.timestamps
    end
  end
end
