import java.io.IOException;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;


public class AvgTemperatureMapper extends MapReduceBase
	implements Mapper<LongWritable, Text ,Text, IntWritable>{

		public void map(LongWritable key,Text value,
			OutputCollector<Text ,IntWritable> output, Reporter reporter)
			throws IOException {

				String[] line = value.toString().split(",");
				//split line by comma into array
				String datePart = line[1];//extract date
				String temp = line[10]; //extract temperature

				if(StringUtils.isNumeric(temp))
					output.collect(new Text(datePart), new IntWritable(Integer.parseInt(temp)));
			}
	}

