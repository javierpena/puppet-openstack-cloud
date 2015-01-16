define cloud::clustering::pacemaker_service (
  $service_name       = false,
  $primitive_class    = 'systemd',
  $primitive_provider = false,
  $primitive_type     = $service_name,
  $clone              = false,
  $colocated_services = [],
  $start_after        = [],
  $requires           = [],
) {

  # Basic sanity check
  if ! $service_name {
    fail 'Please specify service name'
  }

  openstack_extras::pacemaker::service { $service_name :
    ensure              => present,
    metadata            => {},
    ms_metadata         => {},
    operations          => {},
    parameters          => {},
    primitive_class     => $primitive_class,
    primitive_provider  => $primitive_provider,
    primitive_type      => $primitive_type,
    use_handler         => false,
    clone               => $clone,
    require             => $requires,
  }

  if !empty($colocated_services) {
    cloud::clustering::pacemaker_colocation { $colocated_services: }
  }

  if !empty($start_after) {
    cloud::clustering::pacemaker_order { $start_after: }
  }
}
