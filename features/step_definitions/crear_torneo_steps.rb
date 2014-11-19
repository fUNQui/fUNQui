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

When(/^Hago click en el boton crear$/) do
    click_button('Crear')
end

Then(/^Veo un mensaje de "(.*?)"$/) do |content|  
    page.should have_content(content)
end

Then(/^Hay un torneo creado con el nombre "(.*?)" y fecha "(.*?)" y lugar "(.*?)"$/) do |nombre, fecha, lugar|
    hayTorneo = false
    Torneo.all.each do |t|
        if((t.nombre==nombre) && (t.fecha==fecha) && (t.lugar==lugar))
            hayTorneo = true
            t.destroy
        end
    end
    expect(hayTorneo).to eq(true)
end

Then(/^No hay dos torneos creados con el nombre "(.*?)" y fecha "(.*?)" y lugar "(.*?)"$/) do |nombre, fecha, lugar|
  count = 0
    Torneo.all.each do |t|
        if((t.nombre==nombre) && (t.fecha==fecha) && (t.lugar==lugar))
            count = count + 1
            t.destroy
        end
    end
    expect(count).to eq(1)
    count = 0
end

Then(/^No hay un torneo creado con el nombre "(.*?)" y fecha "(.*?)" y lugar "(.*?)"$/) do |nombre, fecha, lugar|
    hayTorneo = false
    Torneo.all.each do |t|
        if((t.nombre==nombre) && (t.fecha==fecha) && (t.lugar==lugar))
            hayTorneo = true
            t.destroy
        end
    end
    expect(hayTorneo).to eq(false)
end

Then(/^Veo un mensaje en el campo "(.*?)"$/) do |content|
    page.should have_content(content)
end

Given(/^Tengo un torneo creardo con el nombre "(.*?)" y fecha "(.*?)" y lugar "(.*?)"$/) do |nombre, fecha, lugar|
    @torneo = Torneo.new
    @torneo.nombre = nombre
    @torneo.fecha = fecha
    @torneo.lugar = lugar
    @torneo.save
end
