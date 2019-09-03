#!/usr/bin/env python3

import gspread
from oauth2client.service_account import ServiceAccountCredentials
import json
import redis
import yaml
import time
import sys
from functional import seq


class LoadRedisData(object):

    _CONFIG = "../redis.yml"
    _CREDENTIAL = '../../config/credential.json'
    _GOOGLE_SHEET_NAME = 'ABS__Application-Navigation-Page'
    _TABLE = 'CecuritySSO'

    def loadSSOMap(self):
        sso = {}
        if self.jsonFileName is None:
            worksheet = self.g.open(self._GOOGLE_SHEET_NAME).worksheets()

            data = []
            for sheet in worksheet[3:9]:
                product = sheet.title.split("-")[0]
                rows = sheet.get_all_values()
                for row in rows[2:]:
                    roles = row[1].replace(' ', '')
                    if roles == "":
                        continue
                    roles = roles.split(',')
                    print(roles)
                    for role in roles:
                        data.append([role, product, row[2], row[4], row[10], row[11], row[12]])

            for d in data:
                if not sso.get(d[0]):
                    sso[d[0]] = {}
                role = sso[d[0]]
                if not role.get(d[1]):
                    role[d[1]] = [{'portlets': []}]
                portlets = role.get(d[1])[0]['portlets']
                portlet = seq(portlets).filter(lambda p: p['portlet'] == d[2]).to_list()
                item = {"link-item": d[3], "browser-url": d[4], "service-api": d[5], "description": d[6]}
                if len(portlet) == 0:
                    portlets.append({'portlet': d[2], 'items': [item]})
                else:
                    portlet[0]['items'].append(item)

            with open('cecurity-sso.json', 'w') as jsonFile:
                print(json.dumps(sso, indent=4), file=jsonFile)
        else:
            with open(self.jsonFileName, 'r') as data_file:
                sso = json.loads(data_file.read())

        for data in sso:
            self.pipe.hset(self._TABLE, data, json.dumps(sso[data]))
        self.pipe.execute()
        print('4. CecuritySSO : ', len(sso))

    def remove_sso_map(self):
        self.pipe.delete(self._TABLE)
        self.pipe.execute()

    def tearDown(self):
        return

    def set_up(self):
        with open(self._CONFIG) as stream:
            try:
                self.config = yaml.load(stream)
            except yaml.YAMLError as exc:
                print(exc)
        redis_pool = redis.ConnectionPool(host=self.config['redis']['host'], port=self.config['redis']['port'], db=self.config['redis']['db'])
        self.redis = redis.Redis(connection_pool=redis_pool)
        self.pipe = self.redis.pipeline()
        self.scope = ['https://spreadsheets.google.com/feeds']
        self.credentials = ServiceAccountCredentials.from_json_keyfile_name(self._CREDENTIAL, self.scope)
        self.g = gspread.authorize(self.credentials)

    def run(self, json_file_name=None):
        start_time = int(round(time.time() * 1000))
        self.jsonFileName = json_file_name
        self.set_up()
        self.remove_sso_map()
        self.loadSSOMap()
        print('Execution Time : ', int(round(time.time() * 1000)) - start_time, 'ms')


if __name__ == '__main__':
    redisData = LoadRedisData()
    if len(sys.argv) == 2:
        redisData.run(sys.argv[1])
    else:
        redisData.run()
