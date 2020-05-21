from piexin.phpipam.address import Address


class TestAddress:

    def __json(self):

        return {
            "id": 0,
            "ip": "bla",
            "hostname": "bla",
            "subnetId": "bla",
            "is_gateway": '0'
        }

    def test_parse_ansible_groups(self):

        address = Address(self.__json())

        string = 'web, group1'

        group_ary = address.parse_ansible_groups(string)

        assert 'web' in group_ary
        assert 'group1' in group_ary
        assert len(group_ary) == 2

    def test_parse_ansible_groups_names(self):

        test_ary = [
            'web',
            'group1',
            'group1_2',
            'anotherGroup'
        ]

        address = Address(self.__json())

        string = ''
        for s in test_ary:
            string = string + s + ', '

        group_ary = address.parse_ansible_groups(string)

        for ix in test_ary:
            assert ix in group_ary

        assert len(group_ary) == len(test_ary)

    def test_parse_ansible_groups_negative(self):

        address = Address(self.__json())

        string = 'web, 0group1, _group1'

        group_ary = address.parse_ansible_groups(string)

        assert 'web' in group_ary
        assert '0group1' not in group_ary
        assert '_group1' not in group_ary
        assert len(group_ary) == 1
