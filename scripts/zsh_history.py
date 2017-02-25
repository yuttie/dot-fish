import codecs
import os


class ZshHistoryReader:
    def __init__(self, src):
        self._src = src

    def read(self, size=-1):
        if size == -1:
            return self.readall()
        else:
            res = bytearray()
            for _ in range(size):
                b = self._decode_byte()
                if b is None:
                    # EOF
                    break
                else:
                    res.append(b)
            return bytes(res)

    def readall(self):
        res = bytearray()
        while True:
            b = self._decode_byte()
            if b is None:
                # EOF
                break
            else:
                res.append(b)
        return bytes(res)

    def _read_byte(self):
        bs = self._src.read(1)
        if len(bs) == 0:
            # EOF
            return None
        else:
            return bs[0]

    def _decode_byte(self):
        b = self._read_byte()
        if b is None:
            None
        elif b == 0x83:
            b2 = self._read_byte()
            return b2 ^ 0x20
        else:
            return b


file = open(os.path.expanduser('~/.zsh_history'), 'rb')
reader = codecs.getreader('utf-8')(ZshHistoryReader(file), errors='ignore')
while True:
    line = reader.readline()
    if line == '':
        break
    else:
        line = line.rstrip()
        line = line[line.index(';') + 1:]
        if line != '':
            while line[-1] == '\\':
                line = line[:-1] + '; ' + reader.readline().rstrip()
            print(line)
