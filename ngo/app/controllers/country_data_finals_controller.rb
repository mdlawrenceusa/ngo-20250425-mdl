class CountryDataFinalsController < ApplicationController
  before_action :set_country_data_final, only: %i[ show edit update destroy ]

  # GET /country_data_finals or /country_data_finals.json
  def index
    @country_data_finals = CountryDataFinal.all
  end

  # GET /country_data_finals/1 or /country_data_finals/1.json
  def show
  end

  # GET /country_data_finals/new
  def new
    @country_data_final = CountryDataFinal.new
  end

  # GET /country_data_finals/1/edit
  def edit
  end

  # POST /country_data_finals or /country_data_finals.json
  def create
    @country_data_final = CountryDataFinal.new(country_data_final_params)

    respond_to do |format|
      if @country_data_final.save
        format.html { redirect_to @country_data_final, notice: "Country data final was successfully created." }
        format.json { render :show, status: :created, location: @country_data_final }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country_data_final.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_data_finals/1 or /country_data_finals/1.json
  def update
    respond_to do |format|
      if @country_data_final.update(country_data_final_params)
        format.html { redirect_to @country_data_final, notice: "Country data final was successfully updated." }
        format.json { render :show, status: :ok, location: @country_data_final }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country_data_final.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_data_finals/1 or /country_data_finals/1.json
  def destroy
    @country_data_final.destroy!

    respond_to do |format|
      format.html { redirect_to country_data_finals_path, status: :see_other, notice: "Country data final was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_data_final
      @country_data_final = CountryDataFinal.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def country_data_final_params
      params.expect(country_data_final: [ :name, :mobilephones, :mortalityunder5, :healthexpenditurepercapita, :healthexpenditureppercentgdp, :population, :populationurban, :birthrate, :lifeexpectancy, :gdp ])
    end
end
