class Api::V1::ProductsController < ApplicationController
	before_action :authenticate_request, only: %i[ show update destroy create ]
	before_action :set_product, only: %i[ show update destroy ]

	def index
		@products = Product.all
		render json: @products, status: 200
	end

	def show
		render json: @product, status: 200
	end

	def create
		begin
			ProcessJson.new(product_params).process
			@products = Product.all
			render json: @products, status: 200
		rescue StandardError, AnotherError => e
			render :json => { :errors => e.inspect }
		end
	end

	def update
		pp product_params
		if @product.update(product_params)
			render json: @product, status: 201
		else
			render json: @product.errors, status: :unprocessable_entity
		end
	end

	def destroy
			@product.destroy
	end

	private
    def set_product
      	@product = Product.find(params[:id])
    end

    def product_params
		params.require(:product).permit(
			:file, 
			:page,
			:title,
			:product_type,
			:description,
			:filename,
			:height,
			:width,
			:price,
			:rating
		)
    end
end
