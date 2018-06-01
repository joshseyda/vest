class CryptoController < ApplicationController
    before_action :set_crypto, only: [:show, :edit, :update, :destroy]

  # GET /crypto
  # GET /crypto.json
  def index
    @crypto = Holding.where("holding_type = 'CRYPTO'")
  end

  # GET /crypto/1
  # GET /crypto/1.json
  def show

  end

  # GET /crypto/new
  def new
    @crypto = Holding.new
  end

  # GET /crypto/1/edit
  def edit
  end

  # POST /crypto
  # POST /crypto.json
  def create
    @crypto = crypto.new(crypto_params)

    respond_to do |format|
      if @crypto.save
        format.html { redirect_to @crypto, notice: 'crypto was successfully created.' }
        format.json { render :show, status: :created, location: @crypto }
      else
        format.html { render :new }
        format.json { render json: @crypto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crypto/1
  # PATCH/PUT /crypto/1.json
  def update
    respond_to do |format|
      if @crypto.update(crypto_params)
        format.html { redirect_to @crypto, notice: 'CRYPTO was successfully updated.' }
        format.json { render :show, status: :ok, location: @crypto }
      else
        format.html { render :edit }
        format.json { render json: @crypto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypto/1
  # DELETE /crypto/1.json
  def destroy
    @crypto.destroy
    respond_to do |format|
      format.html { redirect_to crypto_url, notice: 'CRYPTO was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto
        @holding = Holding.where(name: params[:id])
        @crypto = @holding.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.fetch(:crypto, {})
    end
end
