package net.celloscope.core.util;

import java.io.IOException;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class DateTimeDeserializer extends JsonDeserializer<DateTime> {

    private DateTimeFormatter dateFormat = DateTimeFormat.forPattern(Constant.DATE_FORMAT);

    @Override
    public DateTime deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext) throws IOException {
        String str = paramJsonParser.getText().trim();
        return dateFormat.parseDateTime(str);
    }
    
}