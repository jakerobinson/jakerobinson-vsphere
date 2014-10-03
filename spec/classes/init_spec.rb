require 'spec_helper'
describe 'vsphere' do

  context 'with defaults for all parameters' do
    it { should contain_class('vsphere') }
  end
end
