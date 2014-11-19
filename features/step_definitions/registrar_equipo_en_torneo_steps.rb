require "rspec"

Given(/^Estoy en la pagina de registro de equipo$/) do
  visit '/registrar/equipo'
end

When(/^Ingreso el nombre del equipo "(.*?)"$/) do |nombre_equipo|
  fill_in 'equipo[nombre]' , :with => nombre_equipo
end

When(/^Ingreso el director tecnico "(.*?)"$/) do |nombre_dt|
  fill_in 'equipo[dt]' , :with => nombre_dt
end

When(/^Ingreso los jugadores "(.*?)"$/) do |nombre_de_los_jugadores|
  fill_in 'equipo[jugadores]' , :with => nombre_de_los_jugadores
end

When(/^Apreto el boton crear equipo$/) do
  click_button('Crear')
end

Then(/^Veo un mensaje que dice "(.*?)"$/) do |un_mensaje|
  page.should have_content un_mensaje
end


