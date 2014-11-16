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

end
