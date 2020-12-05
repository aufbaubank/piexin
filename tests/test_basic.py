import pathlib
import os

import piexin


class TestCommand:

    inventory_file_content = '[piexin_all]\n' \
                             'host1.localdomain.local ansible_host=10.0.0.1 piexin_id="11" piexin_subnetId="8" ' \
                               'piexin_ip="10.0.0.1" piexin_description="this is host host1.localdomain.local" ' \
                               'piexin_hostname="host1.localdomain.local" piexin_tag="2" piexin_excludePing="0" ' \
                               'piexin_PTRignore="0" piexin_PTR="0" piexin_editDate="2020-12-04 14:44:19" ' \
                               'piexin_custom_ansible_groups="dmz, group1"\n' \
                             'host2.localdomain.local ansible_host=10.0.0.2 piexin_id="12" piexin_subnetId="8" ' \
                               'piexin_ip="10.0.0.2" piexin_description="this is host host2.localdomain.local" ' \
                               'piexin_hostname="host2.localdomain.local" piexin_tag="2" piexin_excludePing="0" ' \
                               'piexin_PTRignore="0" piexin_PTR="0" piexin_editDate="2020-12-04 14:44:43" ' \
                               'piexin_custom_ansible_groups="group2"\n' \
                             'gateway.localdomain.local ansible_host=10.0.0.6 piexin_id="23" piexin_subnetId="8" ' \
                               'piexin_ip="10.0.0.6" piexin_is_gateway="1" ' \
                               'piexin_hostname="gateway.localdomain.local" piexin_tag="2" piexin_excludePing="0" ' \
                               'piexin_PTRignore="0" piexin_PTR="0"\n' \
                             'host3.localdomain.local ansible_host=10.0.1.1 piexin_id="13" piexin_subnetId="9" ' \
                               'piexin_ip="10.0.1.1" piexin_is_gateway="0" piexin_hostname="host3.localdomain.local" ' \
                               'piexin_tag="2" piexin_excludePing="0" piexin_PTRignore="0" piexin_PTR="0" ' \
                               'piexin_editDate="2020-05-21 08:44:37" piexin_custom_ansible_groups="web1"\n' \
                             'host4.localdomain.local ansible_host=10.0.1.2 piexin_id="14" piexin_subnetId="9" ' \
                               'piexin_ip="10.0.1.2" piexin_description="characters \\\"not allowed\\\"" ' \
                               'piexin_hostname="host4.localdomain.local" piexin_tag="2" piexin_excludePing="0" ' \
                               'piexin_PTRignore="0" piexin_PTR="0" piexin_editDate="2020-12-04 15:17:25" ' \
                               'piexin_custom_ansible_groups="web1"\n' \
                             'windows.localdomain.local ansible_host=10.0.1.3 piexin_id="22" piexin_subnetId="9" ' \
                               'piexin_ip="10.0.1.3" piexin_description="a host based on windows os" ' \
                               'piexin_hostname="WINDOWS.localdomain.local" piexin_tag="2" piexin_excludePing="0" ' \
                               'piexin_PTRignore="0" piexin_PTR="0" piexin_editDate="2020-12-04 14:45:14"\n' \
                             'lonely.localdomain.local ansible_host=10.0.2.1 piexin_id="25" piexin_subnetId="13" ' \
                               'piexin_ip="10.0.2.1" piexin_description="a bad character at the end \\\\" ' \
                               'piexin_hostname="lonely.localdomain.local" piexin_tag="2" piexin_excludePing="0" ' \
                               'piexin_PTRignore="0" piexin_PTR="0" piexin_editDate="2020-12-05 12:09:48" ' \
                               'piexin_custom_ansible_groups="lonely_group"\n' \
                             'host5.localdomain.local ansible_host=172.16.0.1 piexin_id="15" piexin_subnetId="11" ' \
                               'piexin_ip="172.16.0.1" piexin_hostname="host5.localdomain.local" piexin_tag="2" ' \
                               'piexin_excludePing="0" piexin_PTRignore="0" piexin_PTR="0" ' \
                               'piexin_editDate="2020-03-11 10:29:22" piexin_custom_ansible_groups="dmz, group2"\n' \
                             'host6.localdomain.local ansible_host=172.16.0.2 piexin_id="16" piexin_subnetId="11" ' \
                               'piexin_ip="172.16.0.2" piexin_hostname="host6.localdomain.local" piexin_tag="2" ' \
                               'piexin_excludePing="0" piexin_PTRignore="0" piexin_PTR="0" ' \
                               'piexin_editDate="2020-03-11 10:29:28"\n' \
                             'host7.localdomain.local ansible_host=172.16.1.1 piexin_id="17" piexin_subnetId="12" ' \
                               'piexin_ip="172.16.1.1" piexin_hostname="host7.localdomain.local" piexin_tag="2" ' \
                               'piexin_excludePing="0" piexin_PTRignore="0" piexin_PTR="0" ' \
                               'piexin_editDate="2020-03-11 10:29:42"\n' \
                             'host8.localdomain.local ansible_host=172.16.1.2 piexin_id="18" piexin_subnetId="12" ' \
                               'piexin_ip="172.16.1.2" piexin_hostname="host8.localdomain.local" piexin_tag="2" ' \
                               'piexin_excludePing="0" piexin_PTRignore="0" piexin_PTR="0" ' \
                               'piexin_editDate="2020-03-11 10:29:52"\n' \
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

        # test output
        playbook_file_path = os.path.dirname(os.path.realpath(__file__)) + \
            '/test_basic_playbook.yml'

        playbook_return_code = os.system(" ".join([
            "ansible-playbook",
            "-i",
            testfile,
            playbook_file_path
        ]))

        assert playbook_return_code == 0

        os.remove(testfile)
