
require 'spec_helper'
 
describe 'pam::pamd::redhat' do

  oses = {

    'Redhat' => {
      :operatingsystem        => 'Redhat',
      :osfamily               => 'RedHat',
      :operatingsystemrelease => '5.8',
      :lsbdistid              => 'RedhatenterpriseServer',
      :lsbdistrelease         => '5.8',
      :lsbdistcodename        => 'Tikanga',
      :prefix_pamd            => '/etc/pam.d',
    },

  }
  
  oses.keys.each do |os|
  
    let(:facts) { { 
      :operatingsystem        => oses[os][:operatingsystem],
      :operatingsystemrelease => oses[os][:operatingsystemrelease],
    } }
  
    describe "Running on #{os} Release #{oses[os][:operatingsystemrelease]}" do
      it { should include_class('pam::params')  }
      it { should contain_file('/etc/pam.d/system-auth-ac')}
    end

  end

	describe 'Running on unsupported OS' do
		let(:facts) { {
			:operatingsystem => 'solaris'
		} }
		it do
			expect {
				should include_class('pam::params')
			}.to raise_error(Puppet::Error, /^Operating system.*/)
		end
	end
	
end
