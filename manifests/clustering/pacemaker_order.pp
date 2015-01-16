define cloud::clustering::pacemaker_order
{
  $value = split($name,',')
  $first = $value[0]
  $second = $value[1]

  $order_name = "${first}-${second}"

  cs_order{ $order_name :
    first  => "p_${first}",
    second => "p_${second}",
  }
}
