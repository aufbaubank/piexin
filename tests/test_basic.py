import pathlib
import os

import piexin


class TestCommand:

    testfile_inventory = os.path.dirname(os.path.realpath(__file__)) + \
            '/testdata/testfile.ini'

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

        with open(TestCommand.testfile_inventory) as f:
            expected = f.read()

        assert ret.stdout == expected

    def test_successfule_environ(self, script_runner):

        env = {'PHPIPAM_TOKEN': 'developcode'}

        ret = script_runner.run('piexin', '-a', 'development', env=env)

        assert ret.success
        assert ret.stdout != ''
        assert ret.stderr == ''

        with open(TestCommand.testfile_inventory) as f:
            expected = f.read()

        assert ret.stdout == expected

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

        with open(TestCommand.testfile_inventory) as f:
            expected = f.read()

        assert content == expected

        # test output
        playbook_file_path = os.path.dirname(os.path.realpath(__file__)) + \
            '/testdata/test_basic_playbook.yml'

        playbook_return_code = os.system(" ".join([
            "ansible-playbook",
            "-i",
            testfile,
            playbook_file_path
        ]))

        assert playbook_return_code == 0

        os.remove(testfile)
