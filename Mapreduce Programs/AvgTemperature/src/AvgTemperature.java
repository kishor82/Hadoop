import java.io.IOException;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;

/**
 * @author kishor Rathva
 **/
public class AvgTemperature {

	public static void main(String[] args) throws IOException {

		JobConf conf = new JobConf(WordCount.class);
			conf.setJobName("Avg Temp");
			
			conf.setOutputKeyClass(Text.class);
			conf.setOutputValueClass(IntWritable.class);

			conf.setMapperClass(AvgTemperatureMapper.class);
			conf.setReducerClass(AvgTemperatureReducer.class);

			FileInputFormat.setInputPaths(conf, new Path(args[0]));
			FileOutputFormat.setOutputPath(conf, new Path(args[1]));

			JobClient.runJob(conf);
		
		}
}
