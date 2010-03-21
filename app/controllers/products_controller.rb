##########################################################################################
# File:     product.rb
# Project:  Barcode Reader
# Author:   Rob Grmek
# Desc:     The controller for products.
##########################################################################################

class ProductsController < ApplicationController

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Success! The image was successfully read.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        flash[:notice] = 'Failed to process image! Please re-capture an image of the barcode.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end
  
  # DELETE /schedules/1
  # DELETE /schedules/1.xml
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => :products, :action => :new) }
      format.xml  { head :ok }
    end
  end

end
