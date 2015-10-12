class ItemsController < ApplicationController

  def show
  	@item = Item.find( params[ :id ] )
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new( items_params )
  	if @item.save
  		redirect_to @item
  	else
  		render 'new'
  	end
  end

  def update
  	@item = Item.find( params[:id] )
  	if @item.update( items_params )
  		redirect_to @item
  	else
  		render 'edit'
  	end
  end

  def edit
  	@item = Item.find( params[ :id ] )
  end

  private # PRIVATE ***********************************************************

  def items_params
  	params.require( :item).permit( :name , :quantity , :description , :asset_number )
  end
end
