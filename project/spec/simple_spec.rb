require 'spec_helper'

RSpec.describe Simple do
  describe '#hello' do
    context 'when started' do
      it 'return true' do        
        expect(true).to eq(true)
      end
    end
  end
end
