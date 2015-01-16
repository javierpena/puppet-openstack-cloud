define cloud::clustering::pacemaker_colocation {
  $value = split($name,',')
  $service1 = $value[0]
  $service2 = $value[1]
  $colocation_name = "${service1}-${service2}"

  cs_colocation { $colocation_name:
    primitives => [ "p_${service1}", "p_${service2}" ],
  }
}
