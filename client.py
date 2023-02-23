import socket
import sys

def user_input():
    sys.stdout.buffer.write(b'input message?\n')
    sys.stdout.flush()
    return sys.stdin.buffer.readline()

def main():
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

    server_address = '/socket_file'
    print('connecting to {}'.format(server_address))

    try:
        sock.connect(server_address)
    except socket.error as err:
        print(err)
        sys.exit(1)

    try:
        message = user_input()
        sock.sendall(message)
        sock.settimeout(2)
        try:
            while True:
                data = str(sock.recv(32))
                if data:
                    print('Server response: ' + data)
                else:
                    break
        except(TimeoutError):
            print('Socket timeout, ending listening for server messages')

    finally:
        print('closing socket')
        sock.close()


if __name__ == '__main__':
    main()