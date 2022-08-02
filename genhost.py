#!/usr/bin/env python

import os
import socket

def readconf():
  fd = open("hosts.cfg", "rb")
  lines = fd.readlines()
  lines = [line.split() for line in lines if len(lines) > 3 and '#' not in line]
  return {line[0]: line[1] for line in lines}

def readhost():
  fd = open("/etc/hosts", "r")
  lines = fd.readlines()
  lines = [line.split() for line in lines]
  lines = [line[1] for line in lines if len(line) > 1]
  return {line: 0 for line in lines}

def main():
  config = readconf();
  host = readhost()
  update = False
  for key in config.keys():
    if key not in host:
      update = True
      print(f"{key} is not in host")

  if update:

    alias_ip_dict = {}

    for key in config.keys():
      domain = config[key]
      print(f"Querying {domain}")
      ip = socket.gethostbyname(domain)
      alias_ip_dict[key] = ip

    fdh = open("/etc/hosts", "rb")
    with open("/tmp/hosts_append", "wb") as fd:
      while True:
        line = fdh.readline()
        if line is None or len(line) == 0 or "MY_HOSTS" in line:
          break
        fd.write(line)

      fd.write("### MY_HOSTS ###\n")
      for key in alias_ip_dict:
        ip = alias_ip_dict[key]
        fd.write("%016s\t%s\n" % (ip, key))
    os.system("sudo cp /tmp/hosts_append /etc/hosts")

if __name__ == '__main__':
  main()
