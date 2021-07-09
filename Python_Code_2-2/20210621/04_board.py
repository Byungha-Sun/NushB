'''
<쓰기 작업 - insert/update/delete>
1. db연결
2. cursor 객체 생성
3. 실행항 sql 정의
4. cursor 객체의 execute()으로 sql 실행
5. 쓰기 commit
6. db close()

<읽기 작업 - select>
1. db연결
2. cursor 객체 생성
3. 실행항 sql 정의
4. cursor 객체의 execute()으로 sql 실행
5. 검색 결과 cursor에서 fetch
6. db close()
'''