Rails.application.routes.draw do
	# resources :sales
	
	#Aquí muestro el listado de todo lo guardado hasta el momento
	root 'sales#index'
	get 'sales', to: 'sales#index'

	#Lógica para guardar registros
	post 'sales', to: 'sales#create'

	#vista para cargar los campos
	get 'sales/new'
	
	#Aquí muestro los datos guardados, similar al show  
	get 'sales/done'
	
	
	
	# adicional, ruta para el botón eliminar
	resources :sales, only: [] do
		member do
			delete 'eliminar'
		end
	end
	
end
