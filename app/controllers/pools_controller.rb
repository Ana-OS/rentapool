class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :find_pool, only: [:show, :edit,:update, :destroy]

  def index
    @pools = Pool.all

    @markers = @pools.geocoded.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pool: pool })
      }
    end

    if params[:address].present?
      @pools = Pool.where("address ILIKE ?", "%#{params[:address]}%")
    else
     @pools = Pool.all
    end
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
      if @pool.save
        redirect_to pool_path(@pool)
      else
        render 'new'
    end
  end

  def show
    @user = @pool.user
    @pools = Pool.all
  end

  def edit
  end

  def update
    @pool.update(pool_params)
    redirect_to pool_path(@pool)
  end

  def destroy
    @pool.destroy
    redirect_to pools_user_index_path
  end

  private


  def find_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:name, :description, :price_hour, :photo, :address)
  end
end
