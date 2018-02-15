class SalesController < ApplicationController
	def new
		@sale = Sale.new
	end
	
	def index
		@sale = Sale.all
	end
	
	def create
		# raise
		codigo = Sale.maximum(:id).to_i + 1
		detail = params[:sale][:detail]
		category = params[:sale][:category]
		value = params[:sale][:value] != "" ? params[:sale][:value].to_i : 0
		discount = params[:sale][:discount] != "" ? params[:sale][:discount].to_i : 0
		total = value - (value * discount / 100)
		# byebug
		
		if params[:tax] == 'SI'
			tax = 0
		else
			tax = 19
			total = value > 0 ? value - (value * 0.19) : 0
		end
		
		
		@sale = Sale.new
		@sale.cod = codigo
		@sale.detail = detail
		@sale.category = category
		@sale.value = value
		@sale.discount = discount
		@sale.tax = tax
		@sale.total = total
		

		respond_to do |format|
			if @sale.save
				format.html { redirect_to sales_done_path, notice: 'El registro fue almacenado con éxito!' }
			else
				format.html { render sales_new_path, notice: 'No se guardó nada!!' }
			end
		end
	end
	
	def done
		@sale = Sale.last
	end
	
	def eliminar
		@sale = Sale.find(params[:id])
		
		if @sale.destroy
			redirect_to root_path, notice: 'Venta Eliminada!!'
		end
	end
	
end
