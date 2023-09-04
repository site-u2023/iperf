#!/bin/sh /etc/rc.common

START=95
STOP=01

pidfile=/var/run/iperf3.pid
ip=192.168.1.1

start() {
  echo start iperf3
  echo iperf3 --server --daemon --pidfile $pidfile --bind $ip
  echo
  iperf3 --server --daemon --pidfile $pidfile --bind $ip
}
stop() {
  echo stop iperf3
  if [ -e $pidfile ] ; then
    pid=`cat $pidfile`
    kill $pid
  fi
}
