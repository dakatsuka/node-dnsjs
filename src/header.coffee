class Header
  constructor: (req) ->
    @id      =  req.slice(0, 2).readUInt16BE(0)
    @qr      = (req.slice(2, 3).readUInt8(0) >> 7) & 0x01
    @opCode  = (req.slice(2, 3).readUInt8(0) >> 3) & 0x0F
    @aa      = (req.slice(2, 3).readUInt8(0) >> 2) & 0x01
    @tc      = (req.slice(2, 3).readUInt8(0) >> 1) & 0x01
    @rd      =  req.slice(2, 3).readUInt8(0) & 0x1
    @ra      = (req.slice(3, 4).readUInt8(0) >> 7) & 0x01
    @ad      = (req.slice(3, 4).readUInt8(0) >> 5) & 0x01
    @cd      = (req.slice(3, 4).readUInt8(0) >> 4) & 0x01
    @rCode   =  req.slice(3, 4).readUInt8(0) & 0xf
    @qdCount =  req.slice(4, 6).readUInt16BE(0)
    @anCount =  req.slice(6, 8).readUInt16BE(0)
    @nsCount =  req.slice(8, 10).readUInt16BE(0)
    @arCount =  req.slice(10, 12).readUInt16BE(0)


module.exports = Header
