
require 'spec_helper'
 
describe 'pam' do


	context 'OS: Debian' do
		let(:facts) { {
			:operatingsystem => 'Debian'
		} }
		it { should include_class('pam::params')  }
		it { should include_class('pam::package') }
		it { should include_class('pam::config')  }
	end
	
	context 'OS: Redhat' do
		let(:facts) { {
			:operatingsystem => 'Debian'
		} }
		it { should include_class('pam::params')  }
		it { should include_class('pam::package') }
		it { should include_class('pam::config')  }
	end
	
	context 'OS: unspecified' do
		let(:facts) { {
			:operatingsystem => nil
		} }
		it do
			expect {
				should include_class('pam::params')
			}.to raise_error(Puppet::Error, /^Operating system.*/)
		end
	end
	
end
