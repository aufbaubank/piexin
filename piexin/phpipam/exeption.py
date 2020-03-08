

class PhpipamException(Exception):

    def __init__(self, message):

        prefix = 'phpipam error: '

        if isinstance(message, str):
            self.message = prefix + message
        else:
            self.message = prefix + 'unknown error'
