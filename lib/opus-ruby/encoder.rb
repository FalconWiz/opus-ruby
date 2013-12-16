module Opus
	class Encoder
		attr_reader :sample_rate, :channels, :mode, :frame_size
		def initialize(sample_rate, frame_size, channels, mode)
			@sample_rate = sample_rate
			@channels = channels
			@mode = mode
			@frame_size = frame_size

			@encoder = Opus.opus_encoder_create sample_rate, channels, mode, nil #int, int, int, pointer
		end

		def destroy
			Opus.opus_destroy_encoder @encoder
		end

		def encode(data, size, max_data_bytes)
			pcm = FFI::MemoryPointer.new :opus_int16, data.size + 1
      			out = FFI::MemoryPointer.new :uchar, data.size + 1
			len = Opus.opus_encode @encoder, pcm, @frame_size, out, max_data_bytes
			out.read_string_length len
		end
	end
end
