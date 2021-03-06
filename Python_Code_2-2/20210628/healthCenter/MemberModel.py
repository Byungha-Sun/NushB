import pymysql
# import menu


class MemVo:
    def __init__(self, mem_id=None, name=None, user_id=None, pwd=None, phone=None
                 , email=None, pg_id=None, l_id=None):
        self.mem_id = mem_id
        self.name = name
        self.user_id = user_id
        self.pwd = pwd
        self.phone = phone
        self.email = email
        self.pg_id = pg_id
        self.l_id = l_id

    def __str__(self):
        return 'mem_id:' + str(self.mem_id) + ' / name:' + self.name + ' / userid:' + self.user_id + \
               ' / pwd:' + self.pwd + ' / phone:' + self.phone + ' / email:' + self.email + ' \npg' \
               + str(self.pg_id) + '\nlocker:' + str(self.l_id)


class MemVo2:
    def __init__(self, name=None, pg_id=None):
        self.name = name
        self.pg_id = pg_id

    def __str__(self):
        return 'name:' + self.name + ' \npg:' + str(self.pg_id)


class MemVo3:
    def __init__(self, name=None, pg_id=None, l_id=None):
        self.name = name
        self.pg_id = pg_id
        self.l_id = l_id

    def __str__(self):
        return 'name:' + self.name + ' \npg:' + str(self.pg_id) + '\nlocker:' + str(self.l_id)


class pg_id:
    def __init__(self, pg_id=None):
        self.pg_id = pg_id

    def __str__(self):
        return 'pg_id:' + str(self.pg_id)


class Memdao:
    def __init__(self):
        self.conn = None

    def connect(self):
        self.conn = pymysql.connect(host='localhost', user='root', password='1234', db='health', charset='utf8')

    def disconnect(self):
        self.conn.close()

    def mem_insert(self, vo):
        self.connect()
        cur = self.conn.cursor()
        sql = " insert into member(mem_name, mem_user_id, mem_pwd, mem_phone, mem_email) values(%s, %s, %s, %s, %s) "
        vals = (vo.name, vo.user_id, vo.pwd, vo.phone, vo.email)
        cur.execute(sql, vals)
        self.conn.commit()
        self.disconnect()

    def pg_idupdate(self, id, pg_id):
        self.connect()
        cur = self.conn.cursor()
        sql = "update member set pg_id = %s  where mem_user_id = %s"
        vals = (pg_id, id)
        cur.execute(sql, vals)
        self.conn.commit()

    def mem_select(self, id):
        self.connect()
        cur = self.conn.cursor()
        sql = "select * from member where mem_user_id = %s"
        vals = (id,)
        cur.execute(sql, vals)
        row = cur.fetchone()
        self.conn.commit()
        if row != None:
            vo = MemVo(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            return vo

    def master_select2(self, id):
        self.connect()
        cur = self.conn.cursor()
        sql = "select * from member where mem_user_id = %s"
        vals = (id,)
        cur.execute(sql, vals)
        row = cur.fetchone()
        self.conn.commit()
        if row != None:
            vo = MemVo3(row[1], row[6], row[7])
            return vo

    def mem_editpwd(self, id, new_pwd):
        self.connect()
        cur = self.conn.cursor()
        sql = "update member set mem_pwd = %s  where mem_user_id = %s"
        vals = (new_pwd, id)
        cur.execute(sql, vals)
        self.conn.commit()

    def mem_editphone(self, id, new_phone):
        self.connect()
        cur = self.conn.cursor()
        sql = "update member set mem_phone = %s  where mem_user_id = %s"
        vals = (new_phone, id)
        cur.execute(sql, vals)
        self.conn.commit()

    def mem_editemail(self, id, new_email):
        self.connect()
        cur = self.conn.cursor()
        sql = "update member set mem_email = %s  where mem_user_id = %s"
        vals = (new_email, id)
        cur.execute(sql, vals)
        self.conn.commit()

    def mem_delmem(self, pwd):
        self.connect()
        cur = self.conn.cursor()
        sql = "del from member where pwd = %"
        vals = (pwd,)
        cur.execute(sql, vals)
        self.conn.commit()

    def master_select(self, name):
        self.connect()
        cur = self.conn.cursor()
        sql = "select * from member where mem_name=%s"
        vals = (name,)
        cur.execute(sql, vals)
        row = cur.fetchone()
        self.disconnect()
        if row != None:
            vo = MemVo(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            return vo

    def master_memberselectAll(self):
        members = []
        self.connect()
        cur = self.conn.cursor()
        sql = 'select * from member'
        try:
            cur.execute(sql)
            for row in cur:
                members.append(MemVo2(row[1], row[6]))
            return members
        except Exception as e:
            print(e)
        finally:
            self.disconnect()


'''
    def LSelect(self):
        lockers = []
        self.connect()
        cur = self.conn.cursor()
        sql = 'select * from locker'
        try:
            cur.execute(sql)
            for row in cur:
                lockers.append(MemVo(row[0], row[1], row[2]))
            return lockers
        except Exception as e:
            print(e)
        finally:
            self.disconnect()

'''


class MemService:
    login_user_id = None
    login_pwd = None
    login_name = None

    def __init__(self):
        self.dao = Memdao()
        # self.m = menu

    def mem_join(self):
        print('????????????')
        name = input('name:')
        user_id = input('user_id:')
        pwd = input('pwd:')
        print('???????????? ??????')
        phone = input('phone:')
        email = input('email:')
        try:
            self.dao.mem_insert(MemVo(name=name, user_id=user_id, pwd=pwd, phone=phone, email=email))
        except Exception as e:
            print(e)
        else:
            print('??????????????????')

    def mem_login(self):
        print('?????????')
        # if MemService.login_user_id ==None:
        #     print('????????? ?????? ????????????')

        if MemService.login_user_id != None:
            print('?????? ???????????? ?????????')
            return

        user_id = input('id:')
        pwd = input('pwd')
        vo = self.dao.mem_select(user_id)

        if vo == None:
            print('?????? ???????????????')
            return
        else:
            if pwd == vo.pwd:
                print('????????? ??????')
                MemService.login_user_id = user_id
                MemService.login_pwd = pwd


            else:
                print('???????????? ?????????')

    # def master2(self):
    #     print('??????')
    #     user_id = input('id:')
    #     vo = self.dao.select(user_id)
    #     if vo == None:
    #         print('?????? ???????????????')
    #     else:
    #         MemService.login_user_id = user_id

    # def check(self):
    #     print('????????? ??????')
    #     vo = self.dao.select(MemService.login_user_id)
    #     members = self.dao.plotect()
    #     if vo != members:
    #         print('???????????? ????????????')
    #         return
    #     else:
    #         print('????????? ??? ????????????')

    def master_login2(self):
        print('?????????')
        name = input('name:')
        vo = self.dao.master_select(name)
        if vo == None:
            print('?????? ???????????????')
        else:
            login_name=MemService.login_name

    def mem_logout(self):
        print('????????????')
        if MemService.login_user_id == None:  # ????????? ?????? ??????
            print('????????? ?????? ???????????????')
            return
        MemService.login_user_id = None
        MemService.login_pwd = None

    def master_logout2(self):
        if MemService.login_name == None:  # ????????? ?????? ??????
            print('???????????? ??????????????????')
            return
        MemService.login_name = None
        print('????????????')

    def master_end(self):
        if MemService.login_name == None:  # ????????? ?????? ??????
            print('???????????? ??????????????????')
            return
        MemService.login_name = None

    def mem_printMemInfo(self):
        print('???????????????')
        if MemService.login_user_id == None:
            print('???????????? ????????????')
            return
        else:
            pwd = input('??????????????? ????????? ????????????:')
            if MemService.login_pwd == pwd:
                vo = self.dao.mem_select(MemService.login_user_id)
                print('??????????????? ???????????????')
                print(vo)
            else:
                print('??????????????? ???????????? ????????????')
                return

    def mem_editMemInfo(self):
        n = MemService.login_pwd
        pwd = input('???????????? ??????')
        if pwd == n:
            print('???????????????')
        else:
            print('??????????????? ???????????? ????????????')
            return

        if MemService.login_user_id == None:
            print('????????? ?????????')
            return
        m = input('??????????????? 1.???????????? 2.??????????????? 3.??? ????????? 4.????????????')
        if m == '1':
            new_pwd = input('??? pwd:')
            self.dao.mem_editpwd(MemService.login_pwd, new_pwd)
            MemService.login_pwd = new_pwd
            return
        elif m == '2':
            new_phone = input('??? phone:')
            self.dao.mem_editphone(MemService.login_user_id, new_phone)
            return
        elif m == '3':
            new_email = input('??? email:')
            self.dao.mem_editemail(MemService.login_user_id, new_email)
            return
        elif m == '4':
            return

    # ???????????? ???????????? ???????????? ???????????? ??????
    # def master_editMemInfo(self):
    #     m = input('??????????????? 1.???????????? 2.??????????????? 3.??? ?????????')
    #     if m == '1':
    #         new_pwd = input('??? pwd:')
    #         self.dao.editpwd(MemService.login_pwd, new_pwd)
    #         return
    #     elif m == '2':
    #         new_phone = input('??? phone:')
    #         self.dao.editphone(MemService.login_user_id, new_phone)
    #         return
    #     elif m == '3':
    #         new_email = input('??? email:')
    #         self.dao.editemail(MemService.login_user_id, new_email)
    #         return

    def mem_delmember(self):
        print('????????????')
        if MemService.login_user_id == None:
            print('????????? ?????????')
            return
        n = MemService.login_pwd
        pwd = input('???????????? ??????')
        if pwd == n:
            print('???????????????')
            self.dao.mem_delmem(MemService.login_user_id)
            MemService.login_id = None
            print('????????????')
        else:
            print('??????????????? ???????????? ????????????')
            return


class Master:
    def __init__(self):
        self.conn = None
        self.dao = Memdao()
        self.service = MemService()

    def connect(self):
        self.conn = pymysql.connect(host='localhost', user='root', password='464646', db='health', charset='utf8')

    def disconnect(self):
        self.conn.close()

    def masterselect(self):
        self.service.master_login2()
        vo = self.dao.master_select(self.service.login_name)
        print(vo)
        if vo == None:
            return
        m = input('1.pwd ??????, 2.phone ??????, 3.email ??????, 4.????????????')
        if m == '1':
            new_pwd = input('??? pwd:')
            self.dao.mem_editpwd(self.service.login_name, new_pwd)
            self.service.master_logout2()
            return
        elif m == '2':
            new_phone = input('??? phone:')
            self.dao.mem_editphone(self.service.login_name, new_phone)
            self.service.master_logout2()
            return
        elif m == '3':
            new_email = input('??? email:')
            self.dao.mem_editemail(self.service.login_name, new_email)
            self.service.master_logout2()
            return
        elif m == '4':
            print('????????????')
            self.service.master_end()
            return

    def master_MemAll(self):
        print('???????????????')
        members = self.dao.master_memberselectAll()
        for m in members:
            print(m, '\n-----------')

    # ???????????? ???????????? ????????? ??????
    # def master2(self):
    #     print('??????')
    #     user_id = input('id:')
    #     vo = self.dao.select(user_id)
    #     if vo == None:
    #         print('?????? ???????????????')
    #     else:
    #         MemService.login_user_id = user_id

    # def check(self):
    #     print('????????? ??????')
    #     vo = self.dao.select(MemService.login_user_id)
    #     members = self.dao.plotect()
    #     if vo != members:
    #         print('???????????? ????????????')
    #         return
    #     else:
    #         print('????????? ??? ????????????')




