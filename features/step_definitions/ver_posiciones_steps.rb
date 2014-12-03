Given(/^Tengo un partido con equipo A "(.*?)" y equipo B "(.*?)" resultado "(.*?)"$/) do |equipoA, equipoB, resultado|
  @equipo = Equipo.new
  @equipo.nombre = equipoA
  @equipo.jugadores = "L L"
  @equipo.dt = "Pablo"
  @equipo.torneoo = @torneo
  @equipo.save
end

Given(/^Tengo tres partidos con los equipos "(.*?)", "(.*?)" y "(.*?)"$/) do |equipo1, equipo2, equipo3|

	  @equipo = Equipo.new
	  @equipo.nombre = equipo1
	  @equipo.jugadores = "L L"
	  @equipo.dt = "Pablo"
	  @equipo.torneoo = @torneo
	  @equipo.save
	  
	  @equipo = Equipo.new
	  @equipo.nombre = equipo2
	  @equipo.jugadores = "L L"
	  @equipo.dt = "Pablo"
	  @equipo.torneoo = @torneo
	  @equipo.save

	  @equipo = Equipo.new
	  @equipo.nombre = equipo3
	  @equipo.jugadores = "L L"
	  @equipo.dt = "Pablo"
	  @equipo.torneoo = @torneo
	  @equipo.save

	  Torneo.generar_partidos(Torneo.get(@torneo.id))
end


When(/^Aprieto el boton de "(.*?)"$/) do |arg1|
  	click_link('Ver posiciones')
end

Then(/^Veo al primer equipo "(.*?)"$/) do |equipo|
 	count = 0
    page.all('#tablaPosiciones tr').each do |tr|
  
    if(count == 1) 
        columna_resultado1 = tr.all('td')[0].text
        expect(equipo).to eq(columna_resultado1)
        page.should have_content columna_resultado1
      end
      count = count + 1
  end
end

Then(/^Veo al segundo equipo "(.*?)"$/) do |equipo|
  	count = 0
    page.all('#tablaPosiciones tr').each do |tr|
  
    if(count == 2) 
        columna_resultado1 = tr.all('td')[0].text
        expect(equipo).to eq(columna_resultado1)
        page.should have_content columna_resultado1
      end
      count = count + 1
  end
end

Then(/^Veo al tercer equipo "(.*?)"$/) do |equipo|
  	count = 0
    page.all('#tablaPosiciones tr').each do |tr|
  
    if(count == 3) 
        columna_resultado1 = tr.all('td')[0].text
        expect(equipo).to eq(columna_resultado1)
        page.should have_content columna_resultado1
      end
      count = count + 1
  end
end