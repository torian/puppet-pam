require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

@oses = {

  'Debian' => {
    :operatingsystem        => 'Debian',
    :osfamily               => 'Debian',
    :operatingsystemrelease => '7.0',
    :lsbdistid              => 'Debian',
    :lsbdistrelease         => '7.0',
  },

  'Redhat' => {
    :operatingsystem        => 'Redhat',
    :osfamily               => 'Redhat',
    :operatingsystemrelease => '5.0',
    :lsbdistid              => 'Redhat',
    :lsbdistrelease         => '5.0',
  }

}

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
end

