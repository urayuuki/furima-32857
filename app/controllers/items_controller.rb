class ItemsController < ApplicationController

  def index
    @items = Item.all
  end


  
  def new
    
   @item = Item.new    
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
  
  end
end



private

  def item_params
    params.require(:item).permit(:image,:name,:description,:price,:category_id,:condition_id,:shipping_id,:shipment_source_id,:shipping_date_id).merge(user_id: current_user.id)
  end

end