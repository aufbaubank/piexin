class Subnet:

    def __init__(self, subnet_json):

        self.id = subnet_json["id"]
        self.subnet = subnet_json["subnet"]
        self.mask = subnet_json["mask"]
        self.vlan_id = subnet_json["vlanId"]
        self.vlan = None

        self.addresses = []

        self.gateway_address = None

    def set_vlan(self, vlan):

        self.vlan = vlan
