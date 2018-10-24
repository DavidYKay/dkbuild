import std.stdio;

string cmd = "run";

void compileAndRun () {
  import std.process;
  import std.file;
  import std.string;
  string sh = "%s/%s".format(getcwd(), cmd);

  auto res = spawnShell(sh);
}

void main() {
  import std.socket;

  // server
  Socket server = new TcpSocket();
  scope(exit) server.close();
  server.setOption(SocketOptionLevel.SOCKET, SocketOption.REUSEADDR, true);

  server.bind(new InternetAddress(9090));
  server.listen(1);

  while(true) {
    Socket client = server.accept();
    scope(exit) client.close();
    scope(exit) client.shutdown(SocketShutdown.BOTH);

    char[1024] buffer;
    auto received = client.receive(buffer);

    // We can add more commands here.
    // Currently just saying "build"
    auto msg = buffer[0.. received];

    compileAndRun();
  }
}

