require "rspec"

When(/^Hago click en eliminar$/) do
  click_link('Eliminar')
end

Then(/^no tengo un equipo con el nombre "(.*?)"$/) do |nombre|
    count = 0
    Torneo.all.each do |t|
        if( t.nombre == nombre )
            count = count + 1
        end
    end
    expect(count).to eq(0)
end
