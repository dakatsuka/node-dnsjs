class QClass
  CLASSES =
    'IN':   1
    'CH':   3
    'HS':   4
    'NONE': 254
    'ANY':  255

  DEFAULT = CLASSES['IN']


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

    for klass of CLASSES
      do (klass) =>
        @string = klass if CLASSES[klass] == @number


  initialize_from_number: (num) ->
    @number = num

    for klass of CLASSES
      do (klass) =>
        @string = klass if CLASSES[klass] == @number


  initialize_from_string: (str) ->
    @string = str
    @number = CLASSES[str]


module.exports = QClass
