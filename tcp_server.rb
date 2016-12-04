# TCP (Transmission Control Protocol)

require 'socket'

server = TCPServer.new(5678)

while session = server.accept
  session.puts "Hello World. Time: #{Time.now}"
  session.close
end
