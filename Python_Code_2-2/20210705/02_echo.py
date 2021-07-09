#클라이언트 프로그램
import socket

server_ip= '192.168.35.39' #서버주소
server_port = 3333           #서버 포트번호

socket=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket.connect((server_ip, server_port))

msg=input('msg: ')
socket.sendall(msg.encode(encoding='utf-8'))

#서버가 에코로 되돌려보낸 메시지 받음
data=socket.recv(100)
msg=data.decode()
print('echo msg:', msg)

socket.close()