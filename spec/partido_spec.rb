require 'spec_helper'
require_relative '../app/models/partido.rb'

describe Partido do 

	describe 'modelo' do 

		subject { @partido = Partido.new}

		it {should respond_to( :equipoA)}
		it {should respond_to( :equipoB)}
		it {should respond_to( :resultado)}
		it {should respond_to( :torneo)}
	end	

	describe 'Actualizar puntos' do
		
		it 'Actualizar puntos cuando se carga un partido con resultado ganador equipo A' do
			@equipo1 = Equipo.new
			@equipo1.nombre = "1"
			@equipo1.jugadores = "la"
			@equipo1.dt = "b"
			@equipo1.torneo = @torneo

			@equipo2 = Equipo.new
			@equipo2.nombre = "2"
			@equipo2.jugadores = "la"
			@equipo2.dt = "b"
			@equipo2.torneo = @torneo

			@partido1 = Partido.new
			@partido1.torneo = @torneo
			@partido1.equipoA = @equipo1
			@partido1.equipoB = @equipo2
			@partido1.resultado = "-"
			

			@partido1.resultado = "3-1"
			Partido.actualizar_puntos(@partido1,"-")
			expect(@partido1.equipoA.puntos).to eq(3)
			expect(@partido1.equipoB.puntos).to eq(0)
		end

		it 'Actualizar puntos cuando se carga un partido con resultado ganador equipo B' do
			@equipo1 = Equipo.new
			@equipo1.nombre = "1"
			@equipo1.jugadores = "la"
			@equipo1.dt = "b"
			@equipo1.torneo = @torneo

			@equipo2 = Equipo.new
			@equipo2.nombre = "2"
			@equipo2.jugadores = "la"
			@equipo2.dt = "b"
			@equipo2.torneo = @torneo

			@partido = Partido.new
			@partido.torneo = @torneo
			@partido.equipoA = @equipo1
			@partido.equipoB = @equipo2
			@partido.resultado = "-"

			@partido.resultado = "0-1"
			Partido.actualizar_puntos(@partido,"-")
			expect(@partido.equipoA.puntos).to eq(0)
			expect(@partido.equipoB.puntos).to eq(3)

		end

		it 'Actualizar puntos cuando se carga un partido con resultado en empate' do
			@equipo1 = Equipo.new
			@equipo1.nombre = "1"
			@equipo1.jugadores = "la"
			@equipo1.dt = "b"
			@equipo1.torneo = @torneo

			@equipo2 = Equipo.new
			@equipo2.nombre = "2"
			@equipo2.jugadores = "la"
			@equipo2.dt = "b"
			@equipo2.torneo = @torneo

			@partido = Partido.new
			@partido.torneo = @torneo
			@partido.equipoA = @equipo1
			@partido.equipoB = @equipo2
			@partido.resultado = "-"

			@partido.resultado = "1-1"
			Partido.actualizar_puntos(@partido,"-")
			expect(@partido.equipoA.puntos).to eq(1)
			expect(@partido.equipoB.puntos).to eq(1)
		end

		it 'Actualizar puntos cuando se actualiza el resultado un partido' do
			@equipo1 = Equipo.new
			@equipo1.nombre = "1"
			@equipo1.jugadores = "la"
			@equipo1.dt = "b"
			@equipo1.torneo = @torneo

			@equipo2 = Equipo.new
			@equipo2.nombre = "2"
			@equipo2.jugadores = "la"
			@equipo2.dt = "b"
			@equipo2.torneo = @torneo

			@partido = Partido.new
			@partido.torneo = @torneo
			@partido.equipoA = @equipo1
			@partido.equipoB = @equipo2
			@partido.resultado = "-"

			res_partido_viejo = @partido.resultado
			@partido.resultado = "1-1"
			Partido.actualizar_puntos(@partido, res_partido_viejo)
			expect(@partido.equipoA.puntos).to eq(1)
			expect(@partido.equipoB.puntos).to eq(1)

			res_partido_viejo = @partido.resultado
			@partido.resultado = "3-1"
			Partido.actualizar_puntos(@partido, res_partido_viejo)
			expect(@partido.equipoA.puntos).to eq(3)
			expect(@partido.equipoB.puntos).to eq(0)
		end

		
	end

end