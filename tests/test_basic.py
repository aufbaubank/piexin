import pathlib
import os

import piexin


class TestCommand:

    inventory_file_content = '[piexin_all]\n' \
                             'host1.localdomain.local ansible_host=10.0.0.1\n' \
                             'host2.localdomain.local ansible_host=10.0.0.2\n' \
                             'gateway.localdomain.local ansible_host=10.0.0.6\n' \
                             'host3.localdomain.local ansible_host=10.0.1.1\n' \
                             'host4.localdomain.local ansible_host=10.0.1.2\n' \
                             'windows.localdomain.local ansible_host=10.0.1.3\n' \
                             'lonely.localdomain.local ansible_host=10.0.2.1\n' \
                             'host5.localdomain.local ansible_host=172.16.0.1\n' \
                             'host6.localdomain.local ansible_host=172.16.0.2\n' \
                             'host7.localdomain.local ansible_host=172.16.1.1\n' \
                             'host8.localdomain.local ansible_host=172.16.1.2\n' \
                             '\n' \
                             '[dmz]\n' \
                             'host1.localdomain.local\n' \
                             'host5.localdomain.local\n' \
                             '\n' \
                             '[group1]\n' \
                             'host1.localdomain.local\n' \
                             '\n' \
                             '[group2]\n' \
                             'host2.localdomain.local\n' \
                             'host5.localdomain.local\n' \
                             '\n' \
                             '[web1]\n' \
                             'host3.localdomain.local\n' \
                             'host4.localdomain.local\n' \
                             '\n' \
                             '[lonely_group]\n' \
                             'lonely.localdomain.local\n' \
                             '\n' \
                             '[piexin_subnet_10_0_0_0]\n' \
                             'host1.localdomain.local\n' \
                             'host2.localdomain.local\n' \
                             'gateway.localdomain.local\n' \
                             '\n' \
                             '[piexin_subnet_10_0_0_0:vars]\n' \
                             'piexin_subnet = 10.0.0.0\n' \
                             'piexin_subnet_mask = 24\n' \
                             'piexin_gateway_address = 10.0.0.6\n' \
                             'piexin_vlan_id = 3\n' \
                             'piexin_vlan_name = 10_FIRST\n' \
                             '\n' \
                             '[piexin_subnet_10_0_1_0]\n' \
                             'host3.localdomain.local\n' \
                             'host4.localdomain.local\n' \
                             'windows.localdomain.local\n' \
                             '\n' \
                             '[piexin_subnet_10_0_1_0:vars]\n' \
                             'piexin_subnet = 10.0.1.0\n' \
                             'piexin_subnet_mask = 24\n' \
                             'piexin_gateway_address = 10.0.1.4\n' \
                             'piexin_vlan_id = 4\n' \
                             'piexin_vlan_name = 11_SCND\n' \
                             '\n' \
                             '[piexin_subnet_10_0_2_0]\n' \
                             'lonely.localdomain.local\n' \
                             '\n' \
                             '[piexin_subnet_10_0_2_0:vars]\n' \
                             'piexin_subnet = 10.0.2.0\n' \
                             'piexin_subnet_mask = 24\n' \
                             '\n' \
                             '[piexin_subnet_172_16_0_0]\n' \
                             'host5.localdomain.local\n' \
                             'host6.localdomain.local\n' \
                             '\n' \
                             '[piexin_subnet_172_16_0_0:vars]\n' \
                             'piexin_subnet = 172.16.0.0\n' \
                             'piexin_subnet_mask = 24\n' \
                             'piexin_vlan_id = 5\n' \
                             'piexin_vlan_name = 12_THRD\n' \
                             '\n' \
                             '[piexin_subnet_172_16_1_0]\n' \
                             'host7.localdomain.local\n' \
                             'host8.localdomain.local\n' \
                             '\n' \
                             '[piexin_subnet_172_16_1_0:vars]\n' \
                             'piexin_subnet = 172.16.1.0\n' \
                             'piexin_subnet_mask = 24\n' \
                             'piexin_vlan_id = 6\n' \
                             'piexin_vlan_name = 13_4TH\n' \
                             '\n'

    def test_help(self, script_runner):
        version = piexin.__version__

        ret = script_runner.run('piexin', '--version')

        assert ret.success
        assert ret.stdout == '{0}\n'.format(version)
        assert ret.stderr == ''

    def test_no_application_given(self, script_runner):
        ret = script_runner.run('piexin')

        assert not ret.success
        assert ret.stdout == ''
        assert ret.stderr == 'phpipam error: Invalid application id\n'

    def test_no_token_given(self, script_runner):
        ret = script_runner.run('piexin', '-a', 'development')

        assert not ret.success
        assert ret.stdout == ''
        assert ret.stderr == 'phpipam error: Unauthorized\n'

    def test_wrong_token_given(self, script_runner):
        ret = script_runner.run('piexin', '-a', 'development', '-t', 'invalid')

        assert not ret.success
        assert ret.stdout == ''
        assert ret.stderr == 'phpipam error: Unauthorized\n'

    def test_no_cert_given(self, script_runner):
        ret = script_runner.run(
            'piexin', '-a', 'development',
            '-t', 'developcode',
            '-u', 'https://localhost')

        assert not ret.success
        assert ret.stdout == ''
        assert ret.stderr != ''

    def test_with_server_cert(self, script_runner):

        path = pathlib.Path(__file__).parent.absolute().as_posix()

        ret = script_runner.run(
            'piexin',
            '-a', 'development',
            '-t', 'developcode',
            '-u', 'https://localhost',
            '-c', path + '/integration/nginx.crt'
        )

        assert ret.stderr == ''
        assert ret.stdout != ''
        assert ret.success

    def test_successful_params(self, script_runner):
        ret = script_runner.run('piexin', '-a', 'development', '-t', 'developcode')

        assert ret.success
        assert ret.stdout != ''
        assert ret.stderr == ''

        assert ret.stdout == TestCommand.inventory_file_content

    def test_successfule_environ(self, script_runner):

        env = {'PHPIPAM_TOKEN': 'developcode'}

        ret = script_runner.run('piexin', '-a', 'development', env=env)

        assert ret.success
        assert ret.stdout != ''
        assert ret.stderr == ''

        assert ret.stdout == TestCommand.inventory_file_content

    def test_file_output(self, script_runner):

        testfile = '/tmp/testfile.ini'

        if os.path.isfile(testfile):
            os.remove(testfile)

        ret = script_runner.run('piexin',
                                '-a', 'development',
                                '-t', 'developcode',
                                '-o', testfile)

        assert ret.success
        assert ret.stdout == ''
        assert ret.stderr == ''

        with open(testfile, 'r') as f:
            content = f.read()

        assert content == TestCommand.inventory_file_content

        os.remove(testfile)
