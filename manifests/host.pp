# == Class: vsphere::host

class vsphere::host (
  $username,
  $password,
  $server,
  $cluster_path,
  $esx_username,
  $esx_password,
  $esx_ntp_servers,
  $esxhost
){

  transport { "vcenter":
    username => "$username",
    password => "$password",
    server   => $server,
    options  => {
      "insecure" => true,
      "rev" => "5.1",
    },
  }
  vcenter::host { $esxhost:
    path      => $cluster_path,
    username  => $esx_username,
    password  => $esx_password,
    dateTimeConfig => {
      'ntpConfig' => {
        'running' => true,
        'policy'  => 'automatic',
        'server'  => $esx_ntp_servers,
      },
      'timeZone' => {
        'key' => 'UTC',
      },
    },
    transport => Transport['vcenter'],
  }

}
