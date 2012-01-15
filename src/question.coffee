QType  = require('./qtype')
QClass = require('./qclass')

#
# = Name
#
# DNS packet question class
#
# = Description
#
# How to new instance:
#
#   question = new Question(buffer)
#   question = new Question('example.com.', 'A', 'IN')
#
# Can be converted into buffer:
#
#   question.toBuffer()
#
class Question
  constructor: ->
    if typeof arguments['0'] == 'object'
      req = arguments['0']
      req = new Buffer(req.toString('hex'), 'hex')

      @qName  = this.parseQname(req.slice(12, req.length - 4))
      @qType  = new QType(req.slice(req.length - 4, req.length - 2))
      @qClass = new QClass(req.slice(req.length - 2, req.length))

    else if typeof arguments['0'] == 'string' && arguments['0'].split('').pop() == '.'
      @qName  = arguments['0']
      @qType  = new QType(arguments['1'])
      @qClass = new QClass(arguments['2'])

    else
      throw new Error "Invalid Argument"


  parseQname: (buf) ->
    result = ""
    offset = 0

    if buf.length < 2
      return result += "."

    while buf.length
      length = buf.readUInt8(offset)
      offset += 1
      result += buf.toString('ascii', offset, offset + length)
      result += "."
      offset += length

      return result if offset == buf.length - 1


module.exports = Question
