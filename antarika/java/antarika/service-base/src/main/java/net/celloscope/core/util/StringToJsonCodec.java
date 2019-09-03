package net.celloscope.core.util;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.ByteBufInputStream;
import io.netty.buffer.Unpooled;
import io.netty.util.CharsetUtil;

import java.io.IOException;
import java.io.ObjectInputStream;

import org.redisson.client.codec.Codec;
import org.redisson.client.handler.State;
import org.redisson.client.protocol.Decoder;
import org.redisson.client.protocol.Encoder;

public class StringToJsonCodec implements Codec {
    private final Decoder<Object> keyDecoder = new Decoder<Object>() {
        @Override
        public Object decode(ByteBuf buf, State state) throws IOException {
            return buf.toString(CharsetUtil.UTF_8);
        }
    };
    
    private final Encoder keyEncoder = new Encoder() {

    	@Override
		public ByteBuf encode(Object in) throws IOException {
			byte[] st = in.toString().getBytes("UTF-8");
			return  Unpooled.wrappedBuffer(st);
		}
    };
    
    private final Decoder<Object> valueDecoder = new Decoder<Object>() {
        @SuppressWarnings("resource")
		@Override
        public Object decode(ByteBuf buf, State state) throws IOException {
            try {
                return new ObjectInputStream(new ByteBufInputStream(buf)).readObject();
            } catch (Exception e) {
                throw new IOException(e);
            }
        }
    };
    private final Encoder valueEncoder = new Encoder() {
    	@Override
		public ByteBuf encode(Object in) throws IOException {
			byte[] st = in.toString().getBytes("UTF-8");
			return  Unpooled.wrappedBuffer(st);
		}
    };

    @Override
    public Decoder<Object> getMapValueDecoder() {
        return keyDecoder;
        //return valueDecoder;
    }

    @Override
    public Encoder getMapValueEncoder() {
        return valueEncoder;
    }

    @Override
    public Decoder<Object> getMapKeyDecoder() {
        return valueDecoder;
        //return keyDecoder;
    }

    @Override
    public Encoder getMapKeyEncoder() {
        return keyEncoder;
    }

    @Override
    public Decoder<Object> getValueDecoder() {
        return valueDecoder;
    }

    @Override
    public Encoder getValueEncoder() {
        return valueEncoder;
    }
}