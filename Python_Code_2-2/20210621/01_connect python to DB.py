'''
DB 연결
1.db server에 연결. 정상연결수립되면 커넥션 객체를 반환
> conn = pymysql.connect('서버주소','계정','패스워드')

2. 반환받은 커넥션 객체로 커서 객체를 생성한다
>cur = conn.cursor()  #cursor 객체가 db작업할 수 있는 함수들을 가지고 있음

3. 커서 객체로 insert, select, update, delete 작업 수행
cur.execute ('쿼리문/insert,select,update,delete')
쓰기작업은 이대로 끝
conn.commit() (쓰기 작업 완료시키는 함수)
4. select는 검색한 결과를 꺼내야함 검색한 결과는 cursor 객체 자체에 저장됨
    row= cur.fetchone()
    id=row[0]
    pwd = row[1]

5. conn.close() #db연결 끊는것. db 닫음
'''