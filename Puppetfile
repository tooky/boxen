# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "osx",         "2.7.1"

github "dnsmasq",     "2.0.0"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.5.0"
github "go",          "1.1.0"
github "homebrew",    "1.9.5"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.8.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.4"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "alfred",              "1.3.1"
github "brewcask",            "0.0.4", :repo => "phinze/puppet-brewcask"
github "chrome",              "1.2.0"
github "clojure",             "1.3.0"
github "dropbox",             "1.4.0"
github "emacs",               "1.1.6", :repo => "bradleywright/puppet-emacs"
github "emacs_keybindings",   "2.0.0", :repo => "bradleywright/puppet-emacs-keybindings"
github "evernote",            "2.0.6"
github "firefox",             "1.2.3"
github "gitx",                "1.2.0"
github "googledrive",         "1.0.2", :repo => "gblair/puppet-googledrive"
github "iterm2",              "1.2.2"
github "libreoffice",         "4.2.1", :repo => "alphagov/puppet-libreoffice"
github "macvim",              "1.0.0"
github "monocle",             "1.0.0", :repo => "norm/puppet-monocle"
github "ohmyzsh",             "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "onepassword",         "1.1.2"
github "qt",                  "1.3.1"
github "rubymine",            "1.1.0"
github "screen",              "1.0.0"
github "skype",               "1.0.9"
github "sublime_text_3",      "1.0.3", :repo => "jozefizso/puppet-sublime_text_3"
github "unarchiver",          "1.5.0", :repo => "dieterdemeyer/puppet-unarchiver"
github "vagrant",             "3.2.0"
github "vim",                 "1.0.5"
github "virtualbox",          "1.0.10"
github "wget",                "1.0.1"
github "zsh",                 "1.0.0"
