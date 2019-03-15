class profile::ssh_server {
  package { 'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@ubuntu':
    ensure => present,
    user => 'root',
    type => 'ssh-rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDIKTcWdRR/yNMvYa10s+YVwVn/uB5dVma85z0pM1WseTIQ4umMUlDaYkKb5pV4JAtypb7rSj0+d/BxPWuxTzwDwV/wjeRh3i8W9s/sessL7fOmLo8Ijvxsda02LBQ1g6P7IKA5FW64oVYd55zyr48cfHTaKoAvO6jt1KXz7pN6qcHoObcZDkX83c9d2X0qjPMbFA/lBS6o163JseP6IRgpYo0gD3oP7zhTMgnP2RZt5t/kClyAtljjKjlk8gQwIq8/Vo3UzZtiKFOxkbOR0HHoqOw7OKoJ5tw2y+MtrAUZXIF6W+ox6BW8V6Vgk7UgOz3ETEEbdUQKN3FyeCgbaHuh',
  }
}
