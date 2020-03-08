class Vlan:

    def __init__(self, vlan_json):

        self.id = vlan_json["vlanId"]
        self.vlan_id = vlan_json["number"]

        self.name = ''
        if 'name' in vlan_json:
            self.name = vlan_json["name"]
