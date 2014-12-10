class people::tooky {

  # Homebrew - thoughtbot
  exec {
    'tap-homebrew-thoughtbot':
      command => 'brew tap thoughtbot/formulae',
      creates => "${homebrew::config::tapsdir}/thoughtbot-formulae",
  }

  include iterm2::stable
  include iterm2::colors::arthur
  include skype
  include onepassword
  include dropbox
  include chrome
  include alfred
  include libreoffice

  package {
    [
      'direnv',
      'zsh',
      'rcm',
      'icu4c'
    ]:
    ensure => 'present'
  }

  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  osx_chsh { $::luser:
    shell   => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh'],
  }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
  }  

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  file { $home:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'tooky/dotfiles',
    require => File[$home]
  } 

  exec { "install dotfiles":
    provider => 'shell',
    command  => 'rcup -d dotfiles -x README.md -x Brewfile',
    cwd      => $home,
    creates  => "${home}/.zshrc",
    require  => Repository[$dotfiles],
  }
}
