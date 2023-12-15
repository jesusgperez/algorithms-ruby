require 'rspec'
require 'byebug'
require_relative '../algos/bin_packing'


RSpec.describe Bin do
    describe 'Bin-pack' do
        it 'packs a new weight' do
            bin = Bin.new
            array = [0.2,0.4,0.5,0.8,0.1,0.5,0.3,0.6]

            array.each do |weight|
                bin.pack(weight) 
            end

            byebug

            expect(bin.n).to eq(4)
        end
    end
end
