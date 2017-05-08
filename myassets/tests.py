# import sqlite3
# import xlwt
#
# #
# sq = sqlite3.connect('../db.sqlite3')
#
# cu = sq.cursor()
# cu.execute('select * from myassets_asset')
# fields = cu.description
# print(fields)
# results = cu.fetchall()
#
# for f in range(0, len(fields)):
#     print(fields[f][0], end=',')



# import pymysql

# conn = pymysql.connect(host='127.0.0.1',db='assetdb', user='root', password='root', charset='utf8')
# cursor = conn.cursor()
# cursor.execute('select * from myassets_asset;')
# result = cursor.fetchall()
# # print(result,)
# fields = cursor.description
# for f in fields:
#     print(f[0], end=',')


# workbook = xlwt.Workbook()
# #
# sheet = workbook.add_sheet('用户数据', cell_overwrite_ok=True)
#
# for f in range(0,len(fields)):
#     sheet.write(0, f, fields[f][0])

# row = 1
# col = 0
# for row in range(1,len(results)+1):
#     for col in range(0,len(fields)):
#         print(row,col,'{}'.format(results[row-1][col]))

#
# row = 1
# col = 0
# for row in range(1,len(results)+1):
#     for col in range(0,len(fields)):
#         sheet.write(row,col,'{}'.format(results[row-1][col]))
#
# workbook.save('./cmdb.xlsx')

#
# import pymysql
# import xlwt
# def export(host, user, password, dbname, table_name, outputpath):
#     conn = pymysql.connect(host, user, password, dbname, charset='utf8')
#     cursor = conn.cursor()
#
#     count = cursor.execute('select * from ' + table_name)
#     print(count)
#     # 重置游标的位置
#     cursor.scroll(0, mode='absolute')
#     # 搜取所有结果
#     results = cursor.fetchall()
#
#     # 获取MYSQL里面的数据字段名称
#     fields = cursor.description
#     workbook = xlwt.Workbook()
#     sheet = workbook.add_sheet('table_' + table_name, cell_overwrite_ok=True)
#
#     # 写上字段信息
#     for field in range(0, len(fields)):
#         sheet.write(0, field, fields[field][0])
#
#     # 获取并写入数据段信息
#
#     for row in range(1, len(results) + 1):
#         for col in range(0, len(fields)):
#             sheet.write(row, col, u'%s' % results[row - 1][col])
#
#     workbook.save(outputpath)


# 结果测试
# if __name__ == "__main__":
#     export(host='127.0.0.1',dbname='assetdb', user='root', password='root', table_name='myassets_asset', outputpath='./datetest.xlsx')

# import datetime
# print(datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S"))
import xlrd

# f = xlrd.open_workbook('./cmdb.xlsx')
#
# print(f.sheet_names(),'name')
# # sheet1 = f.sheet_by_index(0) # sheet索引从0开始
# sheet1 = f.sheet_by_name('用户数据')
# # print(sheet1.nrows)
# for i in range(1, sheet1.nrows):
#     print(sheet1.row_values(i))

# import  os
# print(os.path.dirname(os.path.abspath(__file__)))

import socket

if __name__ == '__main__':
    PORT = 8088
    sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    sock.bind(('127.0.0.1', PORT))
    sock.listen(2)
    print('Server Listen on port'.format(PORT))
    while True:
        conn, addr = sock.accept()
        print(conn, addr, '################################')
        request = conn.recv(1024)
        print(request,'request----------------------------')
        response = b'HTTP/1.1 200 OK\nCache-Control:max-age=100\nContent-Type:text/html\nServer:myserver\n\nHello World!'
        conn.sendall(response)
        conn.close()
