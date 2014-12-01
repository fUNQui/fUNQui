Given(/^Tengo un torneo "(.*?)"$/) do |nombre|
	Equipo.all.destroy
	Partido.all.destroy
	Torneo.all.destroy
  	@torneo = Torneo.new
    @torneo.nombre = nombre
    @torneo.fecha = "15/11/2014"
    @torneo.comentario = ""
    @torneo.lugar = "Palermo"
    @torneo.save
end

Given(/^Estoy en la pagina de ver los torneos$/) do
  	visit '/torneos'
end

Given(/^Estoy en la pagina de los resultados de los partidos del torneo "(.*?)"$/) do |arg1|
 	uri = URI.parse(current_url)
	expect(uri.path).to eq("/partido/partidos/" + @torneo.id.to_s)
end

When(/^Apreto el link de ver partidos del torneo "(.*?)"$/) do |torneo|
	click_link('Ver partidos')
end

Then(/^Veo la tabla con los tres partidos con resultado "(.*?)"$/) do |resultado|
	count = 0
	page.all('#tablaPartidos tr').each do |tr|
	
		if(count != 0) 
  			columna_resultado = tr.all('td')[1].text
  			expect(resultado).to eq(columna_resultado)
  			page.should have_content columna_resultado
  		end
  		count = count + 1
	end
  	page.should have_css("table#tablaPartidos tr", :count=>4)
end

Given(/^Tengo (\d+) partidos en dicho torneo con resultado "(.*?)"$/) do |arg1, resultado|
  	@equipo1 = Equipo.new
	@equipo1.nombre = "1"
	@equipo1.jugadores = "la"
	@equipo1.dt = "b"
	@equipo1.torneo = @torneo
	@equipo1.save

	@equipo2 = Equipo.new
	@equipo2.nombre = "2"
	@equipo2.jugadores = "la"
	@equipo2.dt = "b"
	@equipo2.torneo = @torneo
	@equipo2.save

	@equipo3 = Equipo.new
	@equipo3.nombre = "3"
	@equipo3.jugadores = "la"
	@equipo3.dt = "b"
	@equipo3.torneo = @torneo
	@equipo3.save
  	Torneo.generar_partidos Torneo.get(@torneo.id)
  	@partidos = @torneo.partidos
	@partidos.each do |p|
		p.resultado = resultado
		p.save
	end
end