## class Autovivify
class AutoVivify(dict):
    """ Implementation of Perl's autovivification feature. """
    def __getitem__(self, item):
        try:
            return dict.__getitem__(self, item)
        except KeyError:
            value = self[item] = type(self)()
            return value

## no need to pre-fine dictionary keys anymore
someDict = AutoVivify()


##
## NOTES: (taken from)
## https://stackoverflow.com/questions/651794/whats-the-best-way-to-initialize-a-dict-of-dicts-in-python
##
