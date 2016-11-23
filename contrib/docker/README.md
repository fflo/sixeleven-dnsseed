# Docker-dnsseed-611

**About**

611 (SixEleven) uses peer-to-peer technology to operate with no central authority or banks; managing transactions and the issuing of 611 (coin: SIL) is carried out collectively by the network. 611 is open-source. Its design is public, nobody owns or controls 611 and everyone can take part. Through many of its unique properties, 611 allows exciting uses that could not be covered by any previous payment and domain name system.

This Docker image provides a `dnsseed-611` application which can be used to run a dns seed node for the 611 (SixEleven) network.

It loads the latest version of sixeleven-dnsseed from git and creates an up-to-date docker image ready to run for you.

**Build**

To build your own image of dnsseed-611 from the latest source code on GitHub run the following command in the contrib/docker directory:

```
$ docker build -t [YourAlias]/sixeleven-dnsseed .
```

Note: After the build is complete replace fflo below with [YourAlias].

**Usage**

To start a dnsseed-611 instance running the latest version:

```
$ docker run --name some-sixeleven fflo/sixeleven-dnsseed
```

To run a dnsseed-611 container in the background, pass the `-d` option to `docker run`:

```
$ docker run -d --name some-sixeleven fflo/sixeleven-dnsseed
```

Once you have a dnsseed-611 service running in the background, you can show running containers:

```
$ docker ps
```

Or view the logs of a service:

```
$ docker logs -f some-sixeleven
```

To stop and restart a running container:

```
$ docker stop some-sixeleven
$ docker start some-sixeleven
```

**Data Volumes**

By default, Docker will create ephemeral containers. That is, the blockchain data will not be persisted if you create a new dnsseed-611 container.

To create a simple `busybox` data volume and link it to a dnsseed-611 service:

```
$ docker create -v /sixeleven --name sixeleven-dnsseed-data busybox /bin/true
$ docker run --volumes-from=sixeleven-dnsseed-data --name=sixeleven-dnsseed-node -d -p 53:53/udp fflo/sixeleven-dnsseed
```

**Configuring dnsseed-611**

a) The easiest method to configure dnsseed-611 is to pass arguments to the `dnsseed-611` command. For example, to get a list of all available configuration options:

```
$ docker run -ti --name sixeleven-dnsseed fflo/sixeleven-dnsseed dnsseed-611 -?

Usage: dnsseed-611 -h <host> -n <ns> [-m <mbox>] [-t <threads>] [-p <port>]

Options:
-h <host>       Hostname of the DNS seed
-n <ns>         Hostname of the nameserver
-m <mbox>       E-Mail address reported in SOA records
-t <threads>    Number of crawlers to run in parallel (default 96)
-d <threads>    Number of DNS server threads (default 4)
-p <port>       UDP port to listen on (default 53)
-o <ip:port>    Tor proxy IP/Port
-i <ip:port>    IPV4 SOCKS5 proxy IP/Port
-k <ip:port>    IPV6 SOCKS5 proxy IP/Port
--testnet       Use testnet
--wipeban       Wipe list of banned nodes
--wipeignore    Wipe list of ignored nodes
-?, --help      Show this text
```

b) You can also use the following environment variables to configure your instance of dnsseed-611

```
$SEED_HOSTNAME - Hostname of your DNS seed (i.e. dns-node-a.611.to)
$NAMESERVER_HOSTNAME - Hostname of your nameserver (NS record, i.e. dnsseed.611.to)
$EMAIL - E-Mail address reported in SOA records
$CRAWLER_THREADS - Number of crawlers to run in parallel (default 96)
$NAMESERVER_THREADS - Number of DNS server threads (default 4)
$SEED_PORT - UDP port to listen on (default 53)
$OPTS - all other options you like to pass (optional)
```

**Debug / Logfile**

By default, dnsseed-611 service will dump any log information to the Docker logs. To debug use:

```
$ docker logs -t sixeleven-dnsseed-node
```
