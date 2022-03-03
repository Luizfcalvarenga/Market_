class OrdersController < ApplicationController
  def new
    @user_id = current_user.id
    @animal = Animal.find(params[:animal_id])
    @order = Order.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @user_id = current_user.id
    @order = Order.new(order_params)
    @order.animal = @animal
    if @order.save
      redirect_to animal_path(@animal)
    else
      render 'animal/show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:adopted, :user_id, :animal_id)
  end
end
