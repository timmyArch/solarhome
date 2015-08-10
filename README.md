# SolarHome

An opensource implementation of SolarLog.

### Current state: **not useable**

## Why its won't work?

Currently I restructuring the App.
I had an quick'n dirty Implementation which has 
performance problems on Raspberry's.
It is designed to controll all devices by using manually
configurable RC power switches. But for this i need
to store as often as possible produced and consumed datapoints.

## Whats the TODO

* Fully replacing SolarLog infastructure.
  * Watch power meter
  * Watch SMA solar control
* Central communication with between server and clients 
  * server could be located in internet
  * remote control for power switches
  * automatisation - when trigger hits turn on rc switch
* Fancy statistics

## Why you wouln't use SolarLog

* Hardware is slow
* Software is slow

So if any of them is slow you got efficency problems.
Sunny moments are coming up and your solar log will only use
a 5 minute aggregate value for enabling any *intelligent* consumers.
SolarLog is also not able do cascase open end consumers. 

