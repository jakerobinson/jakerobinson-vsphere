# == Class: vsphere::vcsa

class vsphere::vcsa (
  $username,
  $password,
  $server,
  $db_type,
  $capacity
){
  vcsa { 'vcsa':
    username => $username,
    password => $password,
    server   => $server,
    db_type  => $db_type,
    capacity => $capacity,
  }
}