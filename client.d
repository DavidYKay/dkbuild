import std.stdio;
import std.socket;

void main() {
  Socket client = new TcpSocket();
  client.setOption(SocketOptionLevel.SOCKET, SocketOption.REUSEADDR, true);
  client.connect(new InternetAddress(9090));
  scope(exit) client.close();

  auto buffer = new ubyte[2056];
  ptrdiff_t amountRead;

  auto result = client.send("build");
}

