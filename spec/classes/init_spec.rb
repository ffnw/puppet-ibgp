require 'spec_helper'
describe 'ibgp' do

  context 'with defaults for all parameters' do
    it { should contain_class('ibgp') }
  end
end
