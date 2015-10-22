class vsphere::maint(
  $username,
  $password,
  $server,
  $esxi_hostname,
  $ensure,
){ 

  if $ensure == 'present' {
    $evacuate = true
  }
  else {
    $evacuate = false
  }

  transport { 'vcenter':
    username => $username,
    password => $password,
    server   => $server,
    options  => {
      "insecure" => true,
      "rev" => "5.1",
    },
  }

  esx_maintmode { $esxi_hostname:
    ensure                    => $ensure,
    timeout                   => 0,
    transport                 => Transport['vcenter'],
    evacuate_powered_off_vms  => $evacuate,
  }
}
