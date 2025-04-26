require "application_system_test_case"

class CountryDataFinalsTest < ApplicationSystemTestCase
  setup do
    @country_data_final = country_data_finals(:one)
  end

  test "visiting the index" do
    visit country_data_finals_url
    assert_selector "h1", text: "Country data finals"
  end

  test "should create country data final" do
    visit country_data_finals_url
    click_on "New country data final"

    fill_in "Birthrate", with: @country_data_final.birthrate
    fill_in "Gdp", with: @country_data_final.gdp
    fill_in "Healthexpenditurepercapita", with: @country_data_final.healthexpenditurepercapita
    fill_in "Healthexpenditureppercentgdp", with: @country_data_final.healthexpenditureppercentgdp
    fill_in "Lifeexpectancy", with: @country_data_final.lifeexpectancy
    fill_in "Mobilephones", with: @country_data_final.mobilephones
    fill_in "Mortalityunder5", with: @country_data_final.mortalityunder5
    fill_in "Name", with: @country_data_final.name
    fill_in "Population", with: @country_data_final.population
    fill_in "Populationurban", with: @country_data_final.populationurban
    click_on "Create Country data final"

    assert_text "Country data final was successfully created"
    click_on "Back"
  end

  test "should update Country data final" do
    visit country_data_final_url(@country_data_final)
    click_on "Edit this country data final", match: :first

    fill_in "Birthrate", with: @country_data_final.birthrate
    fill_in "Gdp", with: @country_data_final.gdp
    fill_in "Healthexpenditurepercapita", with: @country_data_final.healthexpenditurepercapita
    fill_in "Healthexpenditureppercentgdp", with: @country_data_final.healthexpenditureppercentgdp
    fill_in "Lifeexpectancy", with: @country_data_final.lifeexpectancy
    fill_in "Mobilephones", with: @country_data_final.mobilephones
    fill_in "Mortalityunder5", with: @country_data_final.mortalityunder5
    fill_in "Name", with: @country_data_final.name
    fill_in "Population", with: @country_data_final.population
    fill_in "Populationurban", with: @country_data_final.populationurban
    click_on "Update Country data final"

    assert_text "Country data final was successfully updated"
    click_on "Back"
  end

  test "should destroy Country data final" do
    visit country_data_final_url(@country_data_final)
    click_on "Destroy this country data final", match: :first

    assert_text "Country data final was successfully destroyed"
  end
end
