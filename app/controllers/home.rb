Funqui::App.controllers :home do
  
  get :index, :map => '/' do  
    render 'home/index', :layout => 'cover'
  end

end
