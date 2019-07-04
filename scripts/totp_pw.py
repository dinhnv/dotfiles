#!/usr/bin/env python
import os
import hmac
import struct
import time
import base64
import hashlib  # for totp generation


def get_totp_token(key_str):
    key = base64.b32decode(key_str)  # the authentication key
    num = int(time.time()) // 30  # epoch time to 30 sec
    msg = struct.pack(">Q", num)  # pack into a binary thing

    # take a SHA1 HMAC of key and binary-packed time value
    digest = hmac.new(key, msg, hashlib.sha1).digest()

    # last 4 bits of the digest tells us which 4 bytes to use
    offset = ord(digest[19]) & 15
    token_base = digest[offset:offset + 4]

    # unpack that into an integer and strip it down
    token_val = struct.unpack(">I", token_base)[0] & 0x7FFFFFFF
    token = token_val % 1000000
    return "%06d" % token  # pad with leading zeroes


print(get_totp_token(os.environ["LOCAL_TOTP_VPN"]))
