class tval(object):
    def __init__(self, name, high=True):
        self.name = name
        self.high = high
        self.type = 'base'

    def __invert__(self):
        return tval(self.name, not self.high)

    def __or__(self, other):
        return Or(self, other)

    def __and__(self, other):
        return And(self, other)

    def __str__(self):
        return 'v(%s,GND)' % self.name + ('>VIH' if self.high else '<VIL')

    def __repr__(self):
        return str(self)

class Or(tval):
    def __init__(self, *args):
        self.args = list(filter(lambda x: x is not False, args))

    def __invert__(self):
        return And(*[~arg for arg in self.args])

    def __or__(self, other):
        if other is False:
            return Or(*self.args)
        if isinstance(other, Or):
            return Or(*(self.args+other.args))
        return Or(*(self.args+[other]))

    def __str__(self):
        return '(%s)' % ' || '.join(str(arg) for arg in self.args)

class And(tval):
    def __init__(self, *args):
        self.args = list(filter(lambda x: x is not True, args))

    def __invert__(self):
        return Or(*[~arg for arg in self.args])

    def __and__(self, other):
        if other is True:
            return And(*self.args)
        if isinstance(other, And):
            return And(*(self.args+other.args))
        return And(*(self.args+[other]))

    def __str__(self):
        return '(%s)' % ' && '.join(str(arg) for arg in self.args)

vals = ['1111110', '0110000', '1101101', '1111001', '0110011', '1011011', '0011111', '1110000', '1111111', '1110011']
temp = '(v(nLT,GND)<VIL || (v(nBL,GND)>VIH && %s))'
nLT = tval('nLT')
nBL = tval('nBL')
A, B, C, D = (tval(s+'in') for s in ('A', 'B', 'C', 'D'))

def gettval(val):
    return And(*[eval(('' if val & (1<<i) else '~')+'ABCD'[i]) for i in range(4)])

a, b, c, d, e, f, g = (~nLT|(nBL&Or(*[False if vals[v][i]=='0' else gettval(v) for v in range(len(vals))])) for i in range(7))
temp = 'V%s %sout GND {%s ? VOH : 0}\nR%s %s %sout {ROUT}'
for i in ('a', 'b', 'c', 'd', 'e', 'f', 'g'):
    print(temp % (i, i, eval(i), i, i, i))
