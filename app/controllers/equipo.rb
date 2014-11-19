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
  
  post :create do
     @equipo = Equipo.new(params[:equipo])
     @equipos = Equipo.all
     @ya_existe = false
     @equipos.each do |e|
        if @equipo.nombre == e.nombre
          @ya_existe = true
        end
      end

      if @ya_existe
        flash.now[:error] = "El equipo #{@equipo.nombre} ya fue registrado"
        render  "equipo/new"
      elsif @equipo.save
        flash[:success] = "El equipo #{@equipo.nombre} fue creado exitosamente"
        redirect '/equipos'
      end
  end

end