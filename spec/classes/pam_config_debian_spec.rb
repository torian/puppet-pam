
require 'spec_helper'

describe 'pam::config::debian' do

	it { should include_class('pam::params')  }
	
	it do
		should contain_file()
	end
end
