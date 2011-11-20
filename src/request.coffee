Header   = require('./header')
Question = require('./question')


class Request
  constructor: (req) ->
    @header   = new Header(req)
    @question = new Question(req)


module.exports = Request
