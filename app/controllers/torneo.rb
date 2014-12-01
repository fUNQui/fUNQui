Funqui::App.controllers :torneo do
  

  get :new, :map => '/registrar/torneo' do  
    @torneo=Torneo.new
    render 'torneo/new'
  end

  get :new, :map => '/torneos' do  
    @torneos = Torneo.all
    render 'torneo/all'
  end
  
  get :my do
    @torneos = Torneo.all
    render 'torneo/all'
  end 

  get :generar_partidos, :with => :torneo do
      torneo = Torneo.get(params[:torneo])
      @torneos = Torneo.all
      if(Partido.all(:torneo => torneo).count > 0)
          flash.now[:error] = 'Los partidos ya fueron generados'
          render 'torneo/all'
      else
        Torneo.generar_partidos(torneo)
      end
      render 'torneo/all'
  end

  post :create do
	   @torneo = Torneo.new(params[:torneo])
     @torneos = Torneo.all
     @torneoExistente = false
     @torneos.each do |torneo|
        if(torneo.nombre == @torneo.nombre)
          @torneoExistente = true
        end
     end

      if @torneoExistente
        flash.now[:error] = 'Torneo ya existente'
        render 'torneo/new'
      else
          flash.now[:error] = 'Complete campo nombre'
          render 'torneo/new'
          if @torneo.save
            flash[:success] = 'Torneo creado'
            redirect '/torneo/my'
          end
      end
  end
end