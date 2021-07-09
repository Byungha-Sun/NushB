def file_read(path):
    f=open(path,'r',encoding='utf-8')
    s= f.read() #파일 읽기
    f.close() #파일 닫기
    return s

def file_write(path,content):
    f= open(path,'a',encoding='utf-8')
    f.write(content)
    f.close()


