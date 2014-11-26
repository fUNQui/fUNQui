require 'spec_helper'
require_relative '../app/models/partido.rb'

describe Partido do 

	describe 'modelo' do 

		subject { @partido = Partido.new}

		it {should respond_to( :equipoA)}
		it {should respond_to( :equipoB)}
		it {should respond_to( :resultado)}
	end	

end