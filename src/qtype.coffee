class QType
  TYPES =
    'SIGZERO':  0
    'A':        1
    'NS':       2
    'MD':       3
    'MF':       4
    'CNAME':    5
    'SOA':      6
    'MB':       7
    'MG':       8
    'MR':       9
    'NULL':     10
    'WKS':      11
    'PTR':      12
    'HINFO':    13
    'MINFO':    14
    'MX':       15
    'TXT':      16
    'RP':       17
    'AFSDB':    18
    'X25':      19
    'ISDN':     20
    'RT':       21
    'NSAP':     22
    'NSAP_PTR': 23
    'SIG':      24
    'KEY':      25
    'PX':       26
    'GPOS':     27
    'AAAA':     28
    'LOC':      29
    'NXT':      30
    'EID':      31
    'NIMLOG':   32
    'SRV':      33
    'ATMA':     34
    'NAPTR':    35
    'KX':       36
    'CERT':     37
    'DNAME':    39
    'OPT':      41
    'DS':       43
    'SSHFP':    44
    'RRSIG':    46
    'NSEC':     47
    'DNSKEY':   48
    'UINFO':    100
    'UID':      101
    'GID':      102
    'UNSPEC':   103
    'TKEY':     249
    'TSIC':     250
    'IXFR':     251
    'AXFR':     252
    'MAILB':    253
    'MAILA':    254
    'ANY':      255

  DEFAULT = TYPES['A']


  constructor: (arg) ->
    if arg instanceof Buffer
      this.initialize_from_buffer arg
    else if typeof arg == 'number'
      this.initialize_from_number arg
    else if typeof arg == 'string'
      this.initialize_from_string arg
    else
      this.initialize_from_number DEFAULT


  initialize_from_buffer: (buf) ->
    @number = buf.readUInt16BE(0)

    for type of TYPES
      do (type) =>
        @string = type if TYPES[type] == @number


  initialize_from_number: (num) ->
    @number = num

    for type of TYPES
      do (type) =>
        @string = type if TYPES[type] == @number


  initialize_from_string: (str) ->
    @string = str
    @number = TYPES[str]


module.exports = QType
