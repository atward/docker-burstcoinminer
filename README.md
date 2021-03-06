## docker-burstcoinminer

A docker image for mining [Burstcoin](https://www.burst-team.us/) based on [Ubuntu 17.04](https://hub.docker.com/_/ubuntu/) and [creepMiner](https://github.com/Creepsky/creepMiner).

## How to use
The image's entrypoint expects to find ```/conf/mining.conf``` and uses that as the configuration file for the miner. A sample configuration file is provided, but you'll have to change the following:
* Pool / submission address (usually the same)
* Target deadline
* Plotfile locations (you can put the plotfiles in a subdirectory under ```conf```, or mount additional volumes and point to them if necessary)
* Web server address (OPTIONAL - you'll have to set it to the ip address of the host computer AND forward the port to make it accessible)

## Example
If ```/homes/andrew/burstcoin/conf``` on the host machine with IP ```192.168.1.100``` contains:
```
mining.conf (same as sample)
plots/
  <plotfiles>
```

Then, executing:
```
docker run -it --rm -v "/homes/andrew/burstcoin/conf":"/conf" -p 8080:8080 fayf/burstcoinminer
```
will start a miner using the plotfiles, and make available a webserver at http://192.168.1.100:8080 where you can see the miner at work.

## Donations
Support me
```
BURST-ECQM-CWBP-YJRW-HJA3S
```

Support the authors of creepMiner
```
creepSky:
BURST-JBKL-ZUAV-UXMB-2G795

uraymeviar:
BURST-8E8K-WQ2F-ZDZ5-FQWHX
```
