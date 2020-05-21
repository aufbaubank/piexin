import os


class Inventorywriter:

    def __init__(self, src):

        self.src = src

    def write(self, filename):

        new_content = self.get_content_from_source()

        if filename is None or not isinstance(filename, str) or filename == '':
            print(new_content, end='')
            return True

        if os.path.isfile(filename):
            with open(filename) as f:
                existing_content = f.read()
            if existing_content == new_content:
                return True

        with open(filename, 'w') as f:
            f.write(new_content)

    def get_content_from_source(self):

        lines_array_of_arrays = [
            self.get_hosts(),
            self.get_subnets()
        ]

        lines = []
        for ary in lines_array_of_arrays:
            for line in ary:
                lines.append(line)

        return ''.join(lines)

    def get_hosts(self):

        lines = ['[piexin_all]\n']
        groups = {}

        for address in self.src.get_addresses():

            for group in address.ansible_groups:
                if group not in groups:
                    groups[group] = []
                groups[group].append(address.hostname)

            attributes = {
                'ansible_host': address.ip
            }

            attlist = []
            for key, value in attributes.items():
                attlist.append('{0}={1}'.format(key, value))

            lines.append('{0} {1}\n'.format(address.hostname, ''.join(attlist)))

        lines.append('\n')

        for groupname, members in groups.items():
            lines.append('[{0}]\n'.format(groupname))

            for member in members:
                lines.append('{0}\n'.format(member))

            lines.append('\n')

        return lines

    def get_subnets(self):

        lines = []

        for subnet in self.src.get_subnets():

            if len(subnet.addresses) == 0:
                continue

            net_address = subnet.subnet.replace('.', '_')
            group_name = 'piexin_subnet_{0}'.format(net_address)

            # place hosts in group
            lines.append('[{0}]\n'.format(group_name))
            for address in subnet.addresses:
                lines.append('{0}\n'.format(address.hostname))
            lines.append('\n')

            # group vars
            group_vars = [
                '[{0}:vars]\n'.format(group_name),
                'piexin_subnet = {0}\n'.format(subnet.subnet),
                'piexin_subnet_mask = {0}\n'.format(subnet.mask),
            ]

            if subnet.gateway_address:
                group_vars.extend([
                    'piexin_gateway_address = {0}\n'.format(subnet.gateway_address)
                ])

            if subnet.vlan_id != '0':
                group_vars.extend([
                    'piexin_vlan_id = {0}\n'.format(subnet.vlan_id),
                    'piexin_vlan_name = {0}\n'.format(subnet.vlan.name)
                ])

            lines.extend(group_vars)
            lines.append('\n')

        return lines


