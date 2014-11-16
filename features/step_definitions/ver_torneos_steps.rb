Given(/^Tengo una lista con un torneo$/) do
  	@torneo = Torneo.new
  	@torneo.nombre = "Funqui"
  	@torneo.fecha = "15/11/2014"
  	@torneo.comentario = ""
  	@torneo.lugar = "Palermo"
  	@torneo.save
end

Given(/^Estoy en la pagina de los torneos$/) do
  	visit '/torneos'
end

Then(/^Veo la lista con todos los torneos registrados$/) do
  	page.should have_content(@torneo.nombre)
  	page.should have_content(@torneo.fecha)
  	page.should have_content(@torneo.comentario)
  	page.should have_content(@torneo.lugar)
  	Torneo.all.destroy
end
