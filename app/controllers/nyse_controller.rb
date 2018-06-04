class NyseController < ApplicationController
        before_action :set_nyse, only: [:show, :edit, :update, :destroy]
      # GET /nyse
      # GET /nyse.json
      def index
        @nyse = Holding.where("holding_type = 'NYSE'")
        
      end
    
      # GET /nyse/1
      # GET /nyse/1.json
      def show
        @portfolio = Portfolio.new
      end
    
      # GET /nyse/new
      def new
        @portfolio = Portfolio.new
      end
    
      # GET /nyse/1/edit
      def edit
      end
    
      # POST /nyse
      # POST /nyse.json
      def create
        @portfolio = Portfolio.new(user_id: current_user.id, holding_type: "NYSE", holding_id: (Holding.where("name = '#{params[:id]}'").first.id), num_of_shares: params[:num_of_shares]);
        @portfolio.save
        respond_to do |format|
          if @nyse.save
            format.html { redirect_to @nyse, notice: 'nyse was successfully created.' }
            format.json { render :show, status: :created, location: @nyse }
          else
            format.html { render :new }
            format.json { render json: @nyse.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /nyse/1
      # PATCH/PUT /nyse/1.json
      def update
        respond_to do |format|
          if @nyse.update(nyse_params)
            format.html { redirect_to @nyse, notice: 'nyse was successfully updated.' }
            format.json { render :show, status: :ok, location: @nyse }
          else
            format.html { render :edit }
            format.json { render json: @nyse.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /nyse/1
      # DELETE /nyse/1.json
      def destroy
        @nyse.destroy
        respond_to do |format|
          format.html { redirect_to nyse_url, notice: 'NYSE was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_nyse
          @holding = Holding.where(name: params[:id])
          @nyse = @holding.first
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def home_params
          params.fetch(:nyse, {})
        end
    end