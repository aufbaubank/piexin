import re


class Address:

    def __init__(self, host_json):

        self.id = host_json["id"]
        self.ip = host_json["ip"]
        self.hostname = host_json["hostname"]
        self.subnet_id = host_json["subnetId"]

        self.ansible_groups = []
        if 'custom_ansible_groups' in host_json:
            self.ansible_groups = \
                self.parse_ansible_groups(host_json["custom_ansible_groups"])

    def parse_ansible_groups(self, string):

        ret_ary = []
        if not isinstance(string, str):
            return ret_ary

        names_ary = string.split(',')

        re_string = '^[^0-9_][a-zA-Z]+[a-zA-Z0-9_]*$'
        pattern = re.compile(re_string)

        for name in names_ary:
            if pattern.match(name):
                ret_ary.append(name.replace(' ', ''))

        return ret_ary

