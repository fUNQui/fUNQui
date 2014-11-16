Funqui::App.controllers :torneo do
  
  get :new, :map => '/registrar/torneo' do  
    @torneo=Torneo.new
    @torneos = Torneo.all
    render 'torneo/new'
  end

  get :new, :map => '/torneos' do  
    @torneos = Torneo.all
    render 'torneo/all'
  end
  
  post :create do
	   @torneo = Torneo.new(params[:torneo])
     @torneos = Torneo.all
      if @torneo.save
        flash[:success] = 'Torneo creado'
      end
      render 'torneo/all'
  end

end