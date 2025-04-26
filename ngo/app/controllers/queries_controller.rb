class QueriesController < ApplicationController
  # Skip the authenticity token verification temporarily for debugging
  # Remove this in production!
  skip_before_action :verify_authenticity_token
  
  def index
    # Just renders the form
  end
  
  def results
    # Get the selection from params
    @selection = params[:selection]
    
    # Show results based on selection
    case @selection
    when "Q1"
      @title = "Mobile phones"
      @countries = CountryDataFinal.order(mobilephones: :desc).limit(10)
      @field = :mobilephones
    when "Q2"
      @title = "Population"
      @countries = CountryDataFinal.order(population: :desc).limit(10)
      @field = :population
    when "Q3"
      @title = "Life Expectancy"
      @countries = CountryDataFinal.where.not(lifeexpectancy: 0).order(lifeexpectancy: :desc).limit(10)
      @field = :lifeexpectancy
    when "Q4"
      @title = "GDP"
      @countries = CountryDataFinal.where.not(gdp: 0).order(gdp: :desc).limit(10)
      @field = :gdp
    when "Q5"
      @title = "Childhood Mortality"
      @countries = CountryDataFinal.where.not(mortalityunder5: 0).order(mortalityunder5: :asc).limit(10)
      @field = :mortalityunder5
    else
      # If nothing selected, redirect back to the form
      redirect_to queries_path and return
    end
    
    # Explicitly render the results template
    render :results
  end
end