Given(/^Estoy en la pagina de crear torneos$/) do
  	visit '/registrar/torneo'
end

When(/^Ingreso el nombre del torneo "(.*?)"$/) do |nombre|
  	fill_in('torneo[nombre]', :with => nombre )
end

When(/^Ingreso la fecha "(.*?)"$/) do |fecha|
  	fill_in('torneo[fecha]', :with => fecha )
end

When(/^Ingreso el lugar "(.*?)"$/) do |lugar|
    fill_in('torneo[lugar]', :with => lugar )
end

When(/^Ingreso un comentario "(.*?)"$/) do |comentario|
  	fill_in('torneo[comentario]', :with => comentario )
end

When(/^Apreto el boton crear$/) do
	click_button('Crear')
end

Then(/^Hay un torneo creado$/) do
  	@torneos = Torneo.all
  	expect(@torneos.size).to eq(1)
  	Torneo.all.destroy
end

Then(/^No hay un torneo creado$/) do
  	@torneos = Torneo.all
  	expect(@torneos.size).to eq(0)
end


Then(/^Veo un mensaje de "(.*?)"$/) do |content|
	visit '/registrar/torneo'
  	page.should have_content(content)
end

