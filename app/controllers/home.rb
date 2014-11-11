Funqui::App.controllers :home do
  
  get :index, :map => '/' do  
    @torneo=Torneo.new
    @torneos = Torneo.all
    render 'home/index'
  end
  
  post :create do
	   @torneo = Torneo.new(params[:torneo])
     @torneos = Torneo.all
      if @torneo.save
        flash[:success] = 'Torneo creado'
	      render 'home/index'
      else
        flash[:error] = 'Todos los campos son requeridos'
        render 'home/index'
      end

  end

end
