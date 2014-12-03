Funqui::App.controllers :partido do
  

  get :partidos, :with => :torneo do
      @torneo = Torneo.get(params[:torneo])
      @partidos = @torneo.partidos
      render 'partido/all'
  end

  get :resultados, :with => :torneo do
      @torneo = Torneo.get(params[:torneo])
      @partidos = @torneo.partidos
      @partido = Partido.new
      render 'partido/agregar_resultados'
  end

  post :update, :with => :partido_id do
  	@partido = Partido.get(params[:partido_id])
    
    @partido.equipoA.save
    @partido.equipoB.save
    @partido.update(params[:partido])
    Partido.actualizar_puntos(@partido)
    if @partido.save
      flash[:success] = 'Resultado cargado'
      redirect "/partido/resultados/#{@partido.torneo.id}"
    else
      flash.now[:error] = 'Falta llenar campo'
    end  
  end

end