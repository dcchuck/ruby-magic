# Simple GET request
# GET / HTTP/1.1\r\n
#
# GET - the method
# / - Request-URI
# HTTP/1.1 - Protocol Version
# \r\n - Carriage Return (\r) & line feed (\n)
#
# Response
# HTTP/1.1 200\r\nContent-Type: text/html\r\n\r\n\Hello world!
#
# HTTP/1.1 200 - Status Line (protocol & response code) + CRLF
# Headers - (content type only one here), separated by CRLF
# New Line for Body separation
# Body (Hello world!)

require 'socket'

server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3
  session.print "Hello world! The time is #{Time.now}" #4

  session.close
end
