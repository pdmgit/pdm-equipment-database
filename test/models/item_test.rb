
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "item should be valid" do
  	
  	valid_items = []
  	valid_items.push( Item.new( name: "sonic screwdriver" , quantity: 1 , asset_number: "0-100-2015-1" , description: "Very handy for moving the plot along" ) )
  	valid_items.push( Item.new( name: "sonic screwdriver" , quantity: 1 ) )

  	valid_items.each do |valid_item|
  		assert valid_item.valid?
  	end

  end

  test "item should have a name" do

  	invalid_item = Item.new( quantity: 1 , asset_number: "0-100-2015-2" , description: "Very handy for moving the plot along" )

  	assert_not invalid_item.valid?

  end

  test "item name should be unique" do
    valid_item = Item.new( name: "sonic screwdriver" , quantity: 1 , asset_number: "0-100-2015-1" , description: "Very handy for moving the plot along" )
    valid_item.save

    invalid_item = Item.new( name: "sonic screwdriver" , quantity: 1 , asset_number: "0-100-2015-2" , description: "checking for item name duplication" )

    assert_not invalid_item.valid?
  end

  test "item name should be between 1 and 50 characters" do

  	invalid_item = Item.new( name: "x"*51 , quantity: 1 , asset_number: "0-100-2015-3" , description: "A bunch of nonsense" )

  	assert_not invalid_item.valid?

  end

  test "asset number should be unique" do
    valid_item = Item.new( name: "sonic screwdriver" , quantity: 1 , asset_number: "0-100-2015-1" , description: "Very handy for moving the plot along" )
    valid_item.save

    invalid_item = Item.new( name: "sonic wrench" , quantity: 1 , asset_number: "0-100-2015-1" , description: "checking for item name duplication" )

    assert_not invalid_item.valid?
  end

  test "item asset_number should be between 1 and 50 characters" do

  	invalid_item = Item.new( name: "flux capacitor" , quantity: 1 , asset_number: "0-100-2015-4" + "x"*50 , description: "Very handy for moving the plot along" )

  	assert_not invalid_item.valid?

  end

  test "item should be unique" do

  	valid_item = Item.new( name: "sonic screwdriver" , quantity: 1 , asset_number: "0-100-2015-1" , description: "Very handy for moving the plot along" )
  	valid_item.save

  	duplicate_item = valid_item.dup

  	assert_not duplicate_item.valid?

  end

end
