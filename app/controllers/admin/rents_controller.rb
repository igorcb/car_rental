module Admin
  class RentsController < ApplicationController
    before_action :set_rent, only: [:show, :update, :edit]

    def index
      @rents = Rent.all
    end

    def show; end

    def new
      @rent = Rent.new
    end

    def edit; end

    def create
      @rent = Rent.new(rent_params)

      respond_to do |format|
        if @rent.save
          format.html { redirect_to @rent, notice: 'Rental was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      if @rent.update(rent_params)
        flash[:notice] = 'Rent update successfull.'
        redirect_to action: :show, id: @rent.id
      else
        render :edit
      end
    end

    private

      def rent_params
        params.require(:rent).permit(:car_id, :name, :date_start, :date_end)
      end
      
      def set_rent
        @rent = Rent.find(params[:id])
      end
  end
end