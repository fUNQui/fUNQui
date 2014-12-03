Funqui::App.controllers :equipo do
  
  # get :new, :map => '/registrar/equipo' do  
  #   @torneo = Torneo.get(params[:torneo])
  #   @equipo = Equipo.new
  #   render 'equipo/new'
  # end

  get :equipos, :with => :torneo do
    @torneo = Torneo.get(params[:torneo])
    @equipos = @torneo.equipos
    @equipo = Equipo.new
    render 'equipo/all'
  end

  get :create,:with =>:torneo do
    @torneo = Torneo.get(params[:torneo])
    if(Partido.all(:torneo => @torneo).count > 0)
        flash[:error] = "El torneo ya esta cerrado"
        redirect "/torneos"
    else
      @equipo = Equipo.new
      render 'equipo/new'
    end
  end

  get :edit, :with => :equipo_id do
    @equipo = Equipo.get(params[:equipo_id])
    @torneo = @equipo.torneo
    render 'equipo/edit'
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
          redirect "/equipo/create/#{@torneo.id}"
        else
          flash.now[:error] = "Error"
          render  "equipo/new"
        end
      end
      render 'equipo/new'
  end

  post :update, :with => :equipo_id do
    @equipo = Equipo.get(params[:equipo_id])
    @torneo = @equipo.torneo
    @equipo.update(params[:equipo])
    if @equipo.save
      flash[:success] = 'Equipo editado'
      redirect "equipo/equipos/#{@torneo.id}"
    else
      flash.now[:error] = 'Falta llenar campo'
      render 'equipo/edit'
    end  
  end
  
  delete :destroy, :with => :equipo_id do
    @equipo = Equipo.get(params[:equipo_id])
    @torneo = @equipo.torneo
    
    if @equipo.destroy
      flash[:success] = "El equipo #{@equipo.nombre} fue eliminado exitosamente"
    else
      flash[:error] = "El equipo #{@equipo.nombre} no se pudo eliminar"
    end
    
    redirect "equipo/equipos/#{@torneo.id}"
    
  end

end