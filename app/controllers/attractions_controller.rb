class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
  end

  def get_on_ride
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    @ride = Ride.create(user: @user, attraction: @attraction)
    if @ride.take_ride.class == String
      flash[:message] = @ride.take_ride
    else
      flash[:message] = "Thanks for riding the #{@attraction.name}!"
    end
    redirect_to user_path(@user)
  end
  
  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end


end
