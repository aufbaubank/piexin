from piexin.phpipam.address import Address
from piexin.entrypoint import create_argparser


class TestValidateFqdn:

    good_names = [
        "host1.localdomain.local",
        "host2.localdomain.local",
        "host1.localdomain.local.world",
        "host1.other.localdomain.local"
    ]

    bad_names = [
        "host1..localdomain.local",
        "host2.local",
        "host1..localdomain.local.world",
        "host1"
    ]

    host_json_skeleton = {
        "id": 1,
        "ip": 1,
        "subnetId": 1,
        "is_gateway": '0'
    }

    def test_good_names(self):

        for name in TestValidateFqdn.good_names:

            json = TestValidateFqdn.host_json_skeleton
            json["hostname"] = name

            addr = Address(json)

            assert name and addr.validate_fqdn()

    def test_bad_names(self):

        for name in TestValidateFqdn.bad_names:

            json = TestValidateFqdn.host_json_skeleton
            json["hostname"] = name

            addr = Address(json)

            assert name and not addr.validate_fqdn()

    def test_missing_hostname(self):

        json = TestValidateFqdn.host_json_skeleton
        json['hostname'] = None

        address = Address(json)

        assert not address.validate_fqdn()

    def test_empty_hostname(self):

        json = TestValidateFqdn.host_json_skeleton
        json['hostname'] = ''

        address = Address(json)

        assert not address.validate_fqdn()
