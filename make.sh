#!/bin/sh
#dmd -release client.d
#dmd -release server.d
ldc --O2 client.d
ldc --O2 server.d
