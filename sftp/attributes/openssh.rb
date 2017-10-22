default['openssh']['server']['subsystem'] = 'sftp internal-sftp'
default['openssh']['server']['match'] = {
  'Group sftp' => {
    'ChrootDirectory' => '%h',
    'ForceCommand' => 'internal-sftp',
  }
}
