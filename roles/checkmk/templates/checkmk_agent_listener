#!/usr/bin/python
import socket
import subprocess
from threading import *

serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = ""
port = 6556
#print (host)
#print (port)
serversocket.bind((host, port))

class client(Thread):
    def __init__(self, socket, address):
        Thread.__init__(self)
        self.sock = socket
        self.addr = address
        self.start()

    def run(self):
        proc = subprocess.Popen('/usr/bin/check_mk_agent', stdout=subprocess.PIPE)
        tmp = proc.stdout.read()
        self.sock.send(tmp)
        self.sock.shutdown(socket.SHUT_RDWR)
        self.sock.close

serversocket.listen(5)
while 1:
    clientsocket, address = serversocket.accept()
    client(clientsocket, address)