# == Class: vsphere::datacenter

class vsphere::datacenter (
  $username,
  $password,
  $hostname,
  $datacenter
){
    transport { "vcenter":
    username => "$username",
    password => "$password",
    server   => $hostname,
    options  => {
      "insecure" => true,
      "rev" => "5.1",
    },
  }
  vc_datacenter { "/$datacenter":
    path      => "/$datacenter",
    ensure    => present,
    transport => Transport["vcenter"],
  }
}