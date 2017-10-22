name 'sftp'
maintainer 'Jeff Marcom'
maintainer_email 'jeffmarcom@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures sftp'
long_description 'Installs/Configures sftp'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'openssh'
depends 'user'
