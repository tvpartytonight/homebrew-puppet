cask 'puppet-agent-8' do
  arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.0.0'
    if arch == 'arm64'
      sha256 'TBD'
    elsif arch == 'x86_64'
      sha256 'TBD'
    end
  else
    os_ver = '12'
    version '8.0.0'
    if arch == 'x86_64'
      sha256 'TBD'
    elsif arch == 'arm64'
      sha256 'TBD'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet8/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-agent-#{version}-1-installer.pkg"

  name 'Puppet Agent'
  homepage "https://puppet.com/docs/puppet/#{version.major_minor}/about_agent.html"

  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                       ],
            pkgutil:   'com.puppetlabs.puppet-agent'

  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
