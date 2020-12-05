from piexin.inventorywriter.inventorywriter import Inventorywriter


class TestInventoryWriter:

    def test_good_escape_characters(self):

        good_string = "no_bad_characters_at_all"
        cleaned = Inventorywriter.escape_bad_characters(good_string)
        assert good_string == cleaned

    def test_bad_escape_characters(self):

        bad_string = 'asd \" \" ' + '\\'

        cleaned = Inventorywriter.escape_bad_characters(bad_string)

        assert bad_string != cleaned
        assert cleaned == 'asd \\" \\" \\\\'
