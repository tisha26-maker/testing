#!/usr/bin/env python3

import gspread
from oauth2client.service_account import ServiceAccountCredentials
import json
import redis
import yaml
import time
import sys


class LoadRedisData(object):

    _CONFIG = "../redis.yml"
    _CREDENTIAL = '../../config/credential.json'
    _GOOGLE_SHEET_NAME = 'ABS__Application-Navigation-Page'

    def load_script(self, json_file_name):
        application_list = []
        worksheet = self.g.open(self._GOOGLE_SHEET_NAME).worksheet('applications')
        range = worksheet.get_all_values()
        for row in range[2:]:
            dict = {}
            dict["product"] = row[1]
            dict["type"] = row[2]
            dict["name"] = row[4]
            dict["application"] = row[5]
            dict["description"] = row[6]
            dict["userId"] = row[14]
            dict["password"] = row[15]
            dict["roleId"] = row[16]
            application_list.append(dict)
        with open('ApplicationMap.json', 'w') as jsonFile:
            print(json.dumps(application_list, indent=4), file=jsonFile)

    def generate_script(self, json_file_name):
        with open(json_file_name, 'r') as data_file:
            application_list = json.loads(data_file.read())

        for data in application_list:
            obj = {'product': data['product'], 'type': data['type'], 'name': data['name'], 'application': data['application'], 'description': data['description']}
            self.pipe.hset('ApplicationMap', data["application"], json.dumps(obj))
        self.pipe.execute()

        for data in application_list:
            if data['userId'].strip() != '' and data['userId'].strip() != '-':
                obj = {'userId': data['userId'], 'password': data['password'], 'roleId': data['roleId']}
                self.pipe.hset('SystemMap', data["userId"], json.dumps(obj))
        self.pipe.execute()
        self.calculate_time(application_list)

    def remove_application_map(self):
        self.pipe.delete('ApplicationMap')
        self.pipe.execute()

    def calculate_time(self, application_list):
        millis = int(round(time.time() * 1000)) - self.start_time
        seconds = (millis / 1000) % 60
        print('1. ApplicationMap + SystemMap : {}, in {} seconds'.format(len(application_list), int(seconds)))

    def tearDown(self):
        return

    def set_up_redis(self):
        with open(self._CONFIG) as stream:
            try:
                self.config = yaml.load(stream)
            except yaml.YAMLError as exc:
                print(exc)
        redis_pool = redis.ConnectionPool(
            host=self.config['redis']['host'],
            port=self.config['redis']['port'], db=self.config['redis']['db'])
        self.redis = redis.Redis(connection_pool=redis_pool)
        self.pipe = self.redis.pipeline()

    def set_up_gsheet(self):
        self.scope = ['https://spreadsheets.google.com/feeds']
        self.credentials = ServiceAccountCredentials.from_json_keyfile_name(
            self._CREDENTIAL, self.scope)
        self.g = gspread.authorize(self.credentials)

    def run(self, json_file_name=None):
        self.start_time = int(round(time.time() * 1000))
        if json_file_name is None:
            self.set_up_gsheet()
            json_file_name = 'ApplicationMap.json'
            self.load_script(json_file_name)
        self.set_up_redis()
        self.remove_application_map()
        self.generate_script(json_file_name)


if __name__ == '__main__':
    redisData = LoadRedisData()
    if len(sys.argv) == 2:
        redisData.run(sys.argv[1])
    else:
        redisData.run()
