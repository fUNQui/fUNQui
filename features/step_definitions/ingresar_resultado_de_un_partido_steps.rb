Given(/^Tengo tres partidos$/) do
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
end

Given(/^Estoy en la pagina de los partidos del torneo "(.*?)"$/) do |arg1|
    visit "partido/partidos/#{@torneo.id}"
end

When(/^Apreto el boton ingesar resultado$/) do
    click_link('Ingresar resultados')
end

When(/^Ingreso como resultado del primer partido "(.*?)"$/) do |resultado|
  count = 0
  page.all('#tablaPartidosResultados tr').each do |tr|
  
    if(count == 1) 
        columna_resultado = tr.all('td')[1]
        columna_resultado.fill_in('partido[resultado]', :with => resultado)
      end
      count = count + 1
  end
end

When(/^Aprieto Submit$/) do
  count = 0
  page.all('#tablaPartidosResultados tr').each do |tr|
  
    if(count == 1) 
        columna_resultado = tr.all('td')[1]
        columna_resultado.click_button('submit')
      end
      count = count + 1
  end
end

Then(/^El resultado del primer partido es "(.*?)"$/) do |resultado|
    visit "partido/partidos/#{@torneo.id}"
    count = 0
    page.all('#tablaPartidos tr').each do |tr|
  
    if(count != 0) 
        columna_resultado = tr.all('td')[1].text
        expect(resultado).to eq(columna_resultado)
        page.should have_content columna_resultado
      end
      count = count + 1
  end
end

When(/^Ingreso como resultado del segundo partido "(.*?)"$/) do |resultado|
  count = 0
  page.all('#tablaPartidosResultados tr').each do |tr|
  
    if(count == 2) 
        columna_resultado = tr.all('td')[1]
        columna_resultado.fill_in('partido[resultado]', :with => resultado)
      end
      count = count + 1
  end
end

Then(/^El resultado del segundo partido es "(.*?)"$/) do |resultado|
    visit "partido/partidos/#{@torneo.id}"
    count = 0
    page.all('#tablaPartidos tr').each do |tr|
  
    if(count == 2) 
        columna_resultado = tr.all('td')[1].text
        expect(resultado).to eq(columna_resultado)
        page.should have_content columna_resultado
      end
      count = count + 1
  end
end

When(/^Ingreso como resultado del tercer partido "(.*?)"$/) do |resultado|
    count = 0
  page.all('#tablaPartidosResultados tr').each do |tr|
  
    if(count == 3) 
        columna_resultado = tr.all('td')[1]
        columna_resultado.fill_in('partido[resultado]', :with => resultado)
      end
      count = count + 1
  end
end

Then(/^El resultado del terccer partido es "(.*?)"$/) do |resultado|
  visit "partido/partidos/#{@torneo.id}"
    count = 0
    page.all('#tablaPartidos tr').each do |tr|
  
    if(count == 3) 
        columna_resultado = tr.all('td')[1].text
        expect(resultado).to eq(columna_resultado)
        page.should have_content columna_resultado
      end
      count = count + 1
  end
end
