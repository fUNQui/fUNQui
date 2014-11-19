Funqui::App.controllers :equipo do
  
  get :new, :map => '/registrar/equipo' do  
    @equipo = Equipo.new
    @equipos = Equipo.all
    render 'equipo/new'
  end

  get :new, :map => '/equipos' do
    @equipos = Equipo.all  
    render 'equipo/all'
  end

  get :equipos, :with => :torneo do
    @torneo = Torneo.get(params[:torneo])
    @equipos = @torneo.equipos
    render 'equipo/all'
  end

  get :create, :with =>:torneo  do
    @torneo = Torneo.get(params[:torneo])
    @equipo = Equipo.new
    render 'equipo/new'
  end

  post :create, :with => :torneo do
    @torneo = Torneo.get(params[:torneo])
     @equipo = Equipo.new(params[:equipo])
     @equipos = Equipo.all
     @equipo.torneoo = @torneo
     @ya_existe = false
     @equipos.each do |e|
        if @equipo.nombre == e.nombre
          @ya_existe = true
        end
      end

      if @ya_existe
        flash.now[:error] = "El equipo #{@equipo.nombre} ya fue registrado"
        render  "equipo/new"
      else
        if @equipo.save
          flash[:success] = "El equipo #{@equipo.nombre} fue creado exitosamente"
          redirect "/equipo/equipos/#{@torneo.id}"
        else
          flash.now[:error] = "Error"
          render  "equipo/new"
        end
      end
      render 'equipo/new'
  end

end