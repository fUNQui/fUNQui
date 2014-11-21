Given(/^Tengo un torneo creado con el nombre "(.*?)"$/) do |nombre|
    @torneo = Torneo.new
    @torneo.nombre = nombre
    @torneo.fecha = "15/11/2014"
    @torneo.comentario = ""
    @torneo.lugar = "Palermo"
    @torneo.save
end

Given(/^Tengo un equipo en el torneo con el nombre "(.*?)" y jugadores "(.*?)" y dt "(.*?)"$/) do |nombre, jugadores, dt|
  @equipo = Equipo.new
  @equipo.nombre = nombre
  @equipo.jugadores = jugadores
  @equipo.dt = dt
  @equipo.torneo = @torneo
  @equipo.save  
end

Given(/^Estoy en la pagina de los equipos del torneo "(.*?)"$/) do |arg1|
    visit "equipo/equipos/#{@torneo.id.to_s}"
end

When(/^Hago click en editar$/) do
    click_link('Editar')
end

When(/^Modifico el campo nombre por "(.*?)"$/) do |nombre|
  fill_in 'equipo[nombre]' , :with => nombre
end

When(/^Hago click en guardar$/) do
    click_button('Guardar')
end

Then(/^Tengo un equipo con el nuevo nombre "(.*?)"$/) do |nombre|
    page.should have_content nombre
end

Then(/^Veo un mensaje de equipo modificado$/) do
    page.should have_content "Equipo editado"
end

Then(/^Modifico el campo jugadores por "(.*?)"$/) do |jugadores|
    fill_in 'equipo[nombre]' , :with => jugadores
end

Then(/^Tengo un equipo con los nuevos jugadores "(.*?)"$/) do |jugadores|
    page.should have_content jugadores
end

Then(/^Modifico el campo dt por "(.*?)"$/) do |dt|
    fill_in 'equipo[nombre]' , :with => dt
end

Then(/^Tengo un equipo con el nuevo dt "(.*?)"$/) do |dt|
    page.should have_content dt
end
