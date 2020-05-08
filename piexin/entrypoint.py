import argparse
import sys
from piexin.phpipam.phpipam import Phpipam
from piexin.phpipam.exeption import PhpipamException
from piexin.inventorywriter.inventorywriter import Inventorywriter
import piexin


def create_argparser(args):
    """
    parse args
    """
    argp = argparse.ArgumentParser(description=__doc__)
    argp.add_argument(
        '-u', '--url',
        metavar='url', default='http://localhost', type=str,
        help='url of phpipam server api, defaults to http://localhost'
    )
    argp.add_argument(
        '-t', '--token',
        metavar='token', default='', type=str,
        help='api token, can also be stored in environment variable PHPIPAM_TOKEN'
    )
    argp.add_argument(
        '-a', '--app',
        metavar='app', default='', type=str,
        help='phpipam api appname'
    )
    argp.add_argument(
        '-c', '--cert',
        metavar='certificate', default='', type=str,
        help='ssl cert from server if server is not trusted'
    )
    argp.add_argument(
        '-o', '--output',
        metavar='output', default='', type=str,
        help='file to print inventory to'
    )
    argp.add_argument(
        '-V', '--version',
        default=False, action='store_true',
        help='print version'
    )

    argp.add_argument('-v', '--verbose', action='count', default=0)

    return argp.parse_args(args)


def main():
    args = create_argparser(sys.argv[1:])

    if args.version:
        print(piexin.__version__)
        sys.exit()

    try:
        ipam = Phpipam(args)
        inventorywriter = Inventorywriter(ipam)

        ipam.dump()
        inventorywriter.write(args.output)

    except PhpipamException as e:
        print(e.message, file=sys.stderr)
        sys.exit(1)

    except Exception as e:
        print(e, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
