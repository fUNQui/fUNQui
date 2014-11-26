require 'spec_helper'
require_relative '../app/models/torneo.rb'

describe Torneo do 

	describe 'modelo' do 

		subject { @torneo = Torneo.new}

		it {should respond_to( :nombre)}
		it {should respond_to( :fecha)}
		it {should respond_to( :comentario)}
		it {should respond_to( :lugar)}
	end	

	describe 'Generar partidos' do
		
		it 'Generar partidos cuando hay 3 equipos registrados' do
			@torneo = Torneo.new
			@torneo.nombre = "nombre"
			@torneo.fecha = "15/12/2014"
			@torneo.lugar = "Pla"
			@torneo.comentario = "nada"
			@torneo.save

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

			@partido1 = Partido.new
			@partido1.torneo = @torneo
			@partido1.equipoA = @equipo1
			@partido1.equipoB = @equipo2
			@partido2 = Partido.new
			@partido2.torneo = @torneo
			@partido2.equipoA = @equipo1
			@partido2.equipoB = @equipo3
			@partido3 = Partido.new
			@partido3.torneo = @torneo
			@partido3.equipoA = @equipo2
			@partido3.equipoB = @equipo3

			@lista_esperada = [@partido1, @partido2, @partido3]

			Torneo.generar_partidos(@torneo)
			expect(@torneo.partidos.length).to eq(3)
			count = 0
			@torneo.partidos.each do |partido|
				expect(@lista_esperada[count].equipoA).to eq(partido.equipoA)
				expect(@lista_esperada[count].equipoB).to eq(partido.equipoB)
				count = count+1
			end
		end
	end
end
