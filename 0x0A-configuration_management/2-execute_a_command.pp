# 3-kill_process.pp

exec { 'killmenow_process':
  command     => 'pkill -f killmenow',
  refreshonly => true,
}
