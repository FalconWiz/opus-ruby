require 'ffi'
require 'opus-ruby/encoder'
require 'opus-ruby/version'

module Opus
	extend FFI::Library

	ffi_lib 'opus0'

	module Constants
		OPUS_OK = 0
		OPUS_BAD_ARG = -1
		OPUS_BUFFER_TOO_SMALL = -2
		OPUS_INTERNAL_ERROR = -3
		OPUS_INVALID_PACKET = -4
		OPUS_UNINPLEMENTED = -5
		OPUS_INVALID_STATE = -6
		OPUS_ALLOC_FAIL = -7

		OPUS_SET_VBR_REQUEST = 4006
		OPUS_SET_COMPLEXITY_REQUEST = 4010
		OPUS_GET_LOOKAHEAD_REQUEST = 4027
		OPUS_GET_SAMPLE_RATE_REQUEST = 4029
		OPUS_GET_EXPERT_FRAME_DURATION_REQUEST = 4041

	end

	typedef :int 		, :opus_int
	typedef :long_long 	, :opus_int64
	typedef :char 		, :opus_int8
	typedef :uint 		, :opus_uint
	typedef :ulong_long	, :opus_uint64
	typedef :uchar 		, :opus_uint8
	typedef :short 		, :opus_int16
	typedef :ushort 	, :opus_uint16
	typedef :int 		, :opus_int32
	typedef :uint 		, :opus_uint32

	attach_function :opus_encoder_create, [:opus_int32, :int, :int, :pointer], :pointer
	attach_function :opus_encoder_destroy, [:pointer], :void
	attach_function :opus_encode_float, [:pointer, :pointer, :int, :pointer, :opus_int32], :opus_int32
	attach_function :opus_encode, [:pointer, :pointer, :int, :pointer, :opus_int32], :opus_int32
	attach_function :opus_encoder_ctl, [:pointer, :int, :varargs], :int

	attach_function :opus_decoder_create, [:opus_int32, :int, :pointer], :pointer
	attach_function :opus_decoder_destroy, [:pointer], :void
	attach_function :opus_decode_float, [:pointer, :pointer, :opus_int32, :pointer, :int, :int], :int
	attach_function :opus_decode, [:pointer, :pointer, :opus_int32, :pointer, :int, :int], :int
	attach_function :opus_decode_ctl, [:pointer, :int, :varargs], :int

end



