"""Convert .glb files into self-contained glTF JSON (.json) so static hosts
that do not serve .glb can still deliver the models. Usage: glb_to_json.py <in.glb> <out.json>"""
import base64, json, struct, sys
data = open(sys.argv[1], 'rb').read()
magic, version, length = struct.unpack_from('<4sII', data, 0)
assert magic == b'glTF'
off, js, binchunk = 12, None, b''
while off < length:
    clen, ctype = struct.unpack_from('<I4s', data, off); off += 8
    chunk = data[off:off + clen]; off += clen
    if ctype == b'JSON': js = json.loads(chunk)
    elif ctype == b'BIN\x00': binchunk = chunk
if binchunk:
    js['buffers'][0]['uri'] = 'data:application/octet-stream;base64,' + base64.b64encode(binchunk).decode()
json.dump(js, open(sys.argv[2], 'w'), separators=(',', ':'))
