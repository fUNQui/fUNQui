Funqui::App.controllers :posicion do
  
  get :posiciones, :with => :torneo do
      @torneo = Torneo.get(params[:torneo])
      @equipos = @torneo.equipos.sort{ |a,b| b.puntos <=> a.puntos}
      render 'posicion/all'
  end

end