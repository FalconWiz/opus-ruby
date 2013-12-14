require 'ffi'
require 'opus-ruby/encoder'
require 'opus-ruby/version'

module Opus
	extend FFI::Library

	ffi_lib 'Opus'

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

	attach_function :opus_encoder_create, [:pointer, :int, :pointer], :pointer
	attach_function :opus_encoder_destroy, [:pointer], :void
	#Take another look at :opus_encode_float, parameters probably wrong, should have 6 and return int
	attach_function :opus_encode_float, [:pointer, :pointer, :pointer, :pointer, :int], :int
	#opus_encode probably wrong too
	attach_function :opus_encode, [:pointer, :pointer, :pointer, :pointer, :int], :int
	attach_function :opus_encoder_ctl, [:pointer, :int, :varargs], :int

	attach_function :opus_decoder_create, [:pointer, :int, :pointer], :pointer
	attach_function :opus_decoder_destroy, [:pointer], :void
	#Take another look at :opus_decode_float, parameters probably wrong, float and decode should have 6 parameters and return an :int
	attach_function :opus_decode_float, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :int
	#opus_decode probably wrong too
	attach_function :opus_decode, [:pointer, :pointer, :pointer, :pointer, :pointer, :int]
	attach_function :opus_decode_ctl, [:pointer, :int, :varargs], :int

end


