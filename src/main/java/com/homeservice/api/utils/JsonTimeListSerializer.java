package com.homeservice.api.utils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

public class JsonTimeListSerializer {
	
	public static class ListTimeSerializer extends StdSerializer<List<Date>> {

	    private static final long serialVersionUID = -4213356850369170746L;
	    private SimpleDateFormat formatter = new SimpleDateFormat("HH:mm", Locale.US);

	    public ListTimeSerializer() {
	        this(null);
	    }

	    protected ListTimeSerializer(Class<List<Date>> t) {
	        super(t);
	    }

	    @Override
	    public void serialize(List<Date> value, JsonGenerator gen, SerializerProvider provider) throws IOException {
	        List<String> formattedTimes = new ArrayList<>();
	        for (Date date : value) {
	            formattedTimes.add(formatter.format(date));
	        }
	        gen.writeObject(formattedTimes);
	    }
	}

	public static class ListTimeDeserializer extends JsonDeserializer<List<Date>> {

	    private SimpleDateFormat formatter = new SimpleDateFormat("HH:mm", Locale.US);

	    @Override
	    public List<Date> deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
	        ObjectMapper mapper = (ObjectMapper) p.getCodec();
	        JsonNode node = mapper.readTree(p);
	        List<Date> times = new ArrayList<>();

	        for (JsonNode timeNode : node) {
	            try {
	                Date parsedTime = formatter.parse(timeNode.asText());
	                times.add(parsedTime);
	            } catch (ParseException e) {
	                throw new RuntimeException("Error parsing time: " + timeNode.asText(), e);
	            }
	        }

	        return times;
	    }
	}
}
