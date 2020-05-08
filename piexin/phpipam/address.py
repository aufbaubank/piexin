import re


class Address:

    hostname_regex = re.compile('^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?$', re.IGNORECASE)

    def __init__(self, host_json):

        self.id = host_json["id"]
        self.ip = host_json["ip"]
        self.subnet_id = host_json["subnetId"]
        self.hostname = host_json["hostname"]
        self.ansible_groups = []

        # check for multiple field spelling
        for key in ['custom_ansible_groups', 'custom_ansible-groups']:
            if key in host_json:
                self.ansible_groups = \
                    self.parse_ansible_groups(host_json[key])

        # lower hostname
        if isinstance(self.hostname, str):
            self.hostname = self.hostname.lower()

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

    def validate_fqdn(self):

        if not self.hostname or \
                not isinstance(self.hostname, str) or \
                len(self.hostname) == 0 or \
                len(self.hostname) > 253:
            return False

        hostname_parts = self.hostname.split('.')

        if len(hostname_parts) < 3:
            return False

        return all(Address.hostname_regex.match(part) for part in hostname_parts)
