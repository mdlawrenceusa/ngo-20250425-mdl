require "test_helper"

class CountryDataFinalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_data_final = country_data_finals(:one)
  end

  test "should get index" do
    get country_data_finals_url
    assert_response :success
  end

  test "should get new" do
    get new_country_data_final_url
    assert_response :success
  end

  test "should create country_data_final" do
    assert_difference("CountryDataFinal.count") do
      post country_data_finals_url, params: { country_data_final: { birthrate: @country_data_final.birthrate, gdp: @country_data_final.gdp, healthexpenditurepercapita: @country_data_final.healthexpenditurepercapita, healthexpenditureppercentgdp: @country_data_final.healthexpenditureppercentgdp, lifeexpectancy: @country_data_final.lifeexpectancy, mobilephones: @country_data_final.mobilephones, mortalityunder5: @country_data_final.mortalityunder5, name: @country_data_final.name, population: @country_data_final.population, populationurban: @country_data_final.populationurban } }
    end

    assert_redirected_to country_data_final_url(CountryDataFinal.last)
  end

  test "should show country_data_final" do
    get country_data_final_url(@country_data_final)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_data_final_url(@country_data_final)
    assert_response :success
  end

  test "should update country_data_final" do
    patch country_data_final_url(@country_data_final), params: { country_data_final: { birthrate: @country_data_final.birthrate, gdp: @country_data_final.gdp, healthexpenditurepercapita: @country_data_final.healthexpenditurepercapita, healthexpenditureppercentgdp: @country_data_final.healthexpenditureppercentgdp, lifeexpectancy: @country_data_final.lifeexpectancy, mobilephones: @country_data_final.mobilephones, mortalityunder5: @country_data_final.mortalityunder5, name: @country_data_final.name, population: @country_data_final.population, populationurban: @country_data_final.populationurban } }
    assert_redirected_to country_data_final_url(@country_data_final)
  end

  test "should destroy country_data_final" do
    assert_difference("CountryDataFinal.count", -1) do
      delete country_data_final_url(@country_data_final)
    end

    assert_redirected_to country_data_finals_url
  end
end
