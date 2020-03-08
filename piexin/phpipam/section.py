class Section:

    def __init__(self, section_json):

        self.id = section_json["id"]
        self.name = section_json["name"]
        self.subnets = []

