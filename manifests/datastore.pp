# == Class: vsphere::datastore

class vsphere::datastore (
  $username,
  $password,
  $server,
  $datastore_name,
  $esxhost,
  $ensure,
  $type,
  $lun_id
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

  esx_datastore { "${$esxhost}:${$datastore_name}":
    ensure    => $ensure,
    type      => $type,
    lun       => $lun_id,
    transport => Transport['vcenter']
  }
}
