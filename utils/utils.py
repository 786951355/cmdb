URL = 'http://192.168.1.3:8000'

import pymysql
import xlwt


def dbexport(host, user, password, dbname, table_name, outputpath):
    conn = pymysql.connect(host, user, password, dbname, charset='utf8')
    cursor = conn.cursor()
    sql = 'select * from {}'.format(table_name)
    cursor.execute(sql)
    # 重置游标的位置
    cursor.scroll(0, mode='absolute')
    # 搜取所有结果
    results = cursor.fetchall()

    # 获取MYSQL里面的数据字段名称
    fields = cursor.description
    workbook = xlwt.Workbook()
    sheet = workbook.add_sheet('table_{}'.format(table_name), cell_overwrite_ok=True)

    # 写上字段信息
    for field in range(0, len(fields)):
        sheet.write(0, field, fields[field][0])

    # 获取并写入数据段信息
    for row in range(1, len(results) + 1):
        for col in range(0, len(fields)):
            sheet.write(row, col, u'%s' % results[row - 1][col])

    workbook.save(outputpath)
