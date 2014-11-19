require 'spec_helper'
require_relative '../app/models/equipo.rb'

describe Equipo do 

  describe 'modelo' do 

    subject { @equipo = Equipo.new}

    it {should respond_to( :nombre)}
    it {should respond_to( :jugadores)}
    it {should respond_to( :dt)}
  end 

end