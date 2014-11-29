Funqui::App.controllers :partido do
  

  get :partidos, :with => :torneo do
      torneo = Torneo.get(params[:torneo])
      @partidos = torneo.partidos
      render 'partido/all'
  end
end