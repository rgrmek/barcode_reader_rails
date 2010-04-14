##########################################################################################
# File:     product.rb
# Project:  Barcode Reader
# Author:   Rob Grmek
# Desc:     The controller for products.
##########################################################################################

class ProductsController < ApplicationController

  # ignore authenticity token so it no longer needs to be passed in the HTTP requests
  skip_before_filter :verify_authenticity_token

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
        flash[:notice] = 'Success! Barcode: ' + @product.barcode + '. Format: ' + @product.barcode_format + '.'
        format.html { render :action => "message" }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        flash[:error] = 'Please re-capture an image of the barcode.'
        format.html { render :action => "message" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def message
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
