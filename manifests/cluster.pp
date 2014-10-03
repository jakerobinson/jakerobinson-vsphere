# == Class: vsphere::cluster

class vsphere::cluster (
  $username,
  $password,
  $server,
  $cluster_path,
  $ha_enabled,
  $admission_control_enabled,
  $admission_policy,
  $host_monitoring,
  $drs_enabled,
  $vmotion_rate
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
  vcenter::cluster { $cluster_path:
    ensure    => present,
    transport => Transport["vcenter"],
    clusterConfigSpecEx => {
      dasConfig => {
        enabled                 => $ha_enabled,
        admissionControlEnabled => $admission_control_enabled,
        admissionControlPolicy  => $admission_policy,
        hostMonitoring          => $host_monitoring,
        vmMonitoring            => "vmMonitoringDisabled",
      },
    },
  }
  vc_cluster_drs { $cluster_path:
    enabled                      => $drs_enabled,
    enable_vm_behavior_overrides => true,
    default_vm_behavior          => "fullyAutomated",
    vmotion_rate                 => $vmotion_rate,
    transport                    => Transport["vcenter"],
    require                      => Vc_cluster[$cluster_path],
  }
}
