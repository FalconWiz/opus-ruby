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
		OPUS_SET_APPLICATION_REQUEST = 4000
		OPUS_GET_APPLICATION_REQUEST = 4001
		OPUS_SET_BITRATE_REQUEST = 4002
		OPUS_GET_BITRATE_REQUEST = 4003
		OPUS_SET_MAX_BANDWIDTH_REQUEST = 4004
		OPUS_GET_MAX_BANDWIDTH_REQUEST = 4005
		OPUS_SET_VBR_REQUEST = 4006
		OPUS_GET_VBR_REQUEST = 4007
		OPUS_SET_BANDWIDTH_REQUEST = 4008
		OPUS_GET_BANDWIDTH_REQUEST = 4009
		OPUS_SET_COMPLEXITY_REQUEST = 4010
		OPUS_GET_COMPLEXITY_REQUEST = 4011
		OPUS_SET_INBAND_FEC_REQUEST = 4012
		OPUS_GET_INBAND_FEC_REQUEST = 4013
		OPUS_SET_PACKET_LOSS_PERC_REQUEST = 4014
		OPUS_GET_PACKET_LOSS_PERC_REQUEST = 4015
		OPUS_SET_DTX_REQUEST = 4016
		OPUS_GET_DTX_REQUEST = 4017
		OPUS_SET_VBR_CONSTRAINT_REQUEST = 4020
		OPUS_GET_VBR_CONSTRAINT_REQUEST = 4021
		OPUS_SET_FORCE_CHANNELS_REQUEST = 4022
		OPUS_GET_FORCE_CHANNELS_REQUEST = 4023
		OPUS_SET_SIGNAL_REQUEST = 4024
		OPUS_GET_SIGNAL_REQUEST = 4025
		OPUS_GET_LOOKAHEAD_REQUEST = 4027
		OPUS_GET_SAMPLE_RATE_REQUEST = 4029
		OPUS_GET_FINAL_RANGE_REQUEST = 4031
		OPUS_GET_PITCH_REQUEST = 4033
		OPUS_SET_GAIN_REQUEST = 4034
		OPUS_GET_GAIN_REQUEST 4045 #/* Should have been = 4035 */
		OPUS_SET_LSB_DEPTH_REQUEST = 4036
		OPUS_GET_LSB_DEPTH_REQUEST = 4037
		OPUS_GET_LAST_PACKET_DURATION_REQUEST = 4039
		OPUS_SET_EXPERT_FRAME_DURATION_REQUEST = 4040
		OPUS_GET_EXPERT_FRAME_DURATION_REQUEST = 4041
		OPUS_SET_PREDICTION_DISABLED_REQUEST = 4042
		OPUS_GET_PREDICTION_DISABLED_REQUEST = 4043
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



