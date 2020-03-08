import requests
from .exeption import PhpipamException
from .section import Section
from .subnet import Subnet
from .address import Address
from .vlan import Vlan

class Phpipam:

    def __init__(self, args):

        self.url = '{0}/api/{1}'.format(args.url, args.app)
        self.headers = {
            "token": args.token
        }
        self.verify = True
        if args.cert != '':
            self.verify = args.cert

        self.vlans = []
        self.addresses = []
        self.subnets = []
        self.sections = []

    def __request(self, req):

        url = self.url + req
        headers = self.headers
        verify = self.verify
        ret = requests.get(url, headers=headers, verify=verify).json()

        if ret['code'] != 200:
            raise PhpipamException(ret['message'])

        if 'data' not in ret:
            return []  # empty response
        return ret['data']

    def dump(self):

        for json in self.__request('/sections'):

            section = Section(json)
            self.sections.append(section)

            subnets_json = self.__request(
                '/sections/{0}/subnets'.format(section.id))
            for subnet_json in subnets_json:
                subnet = Subnet(subnet_json)
                section.subnets.append(subnet)
                self.subnets.append(subnet)

                address_json = self.__request(
                    '/subnets/{0}/addresses/'.format(subnet.id))
                for address_json in address_json:
                    address = Address(address_json)

                    subnet.addresses.append(address)
                    self.addresses.append(address)

                if subnet.vlan_id != '0':
                    vlan_json = self.__request(
                                '/vlan/{0}'.format(subnet.vlan_id))
                    if len(vlan_json) > 0:
                        subnet.set_vlan(Vlan(vlan_json))

    def get_addresses(self):
        return self.addresses

    def get_subnets(self):
        return self.subnets

    def get_vlans(self):
        return self.vlans

