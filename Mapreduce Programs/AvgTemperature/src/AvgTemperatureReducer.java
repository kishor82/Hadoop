import java.io.IOException;
import java.util.Iterator;

import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;

public class AvgTemperatureReducer extends MapReduceBase
	implements Reducer<Text ,IntWritable ,Text , IntWritable>{

		public void reduce(Text key,Iterator<IntWritable> values,
			OutputCollector<Text,IntWritable> output,Reporter reporter)
			throws IOException {

				int sumTemps = 0 ;//sum of all temps per key
				int numItems = 0 ; 
				while (values.hasNext()){
					sumTemps += values.next().get();
					numItems += 1;
				}

				/* Get MIN of all temps *
				int minValue = Integer.MAX_VALUE;
				while (vlaues.hasNext()){
					minValue = Math.min(minValue , values.next().get());
				} */

				/* Get MAX of all temps *
				int maxValue = Integer.MIN_VLAUE ;
				while (values.hasnext()){
					maxValue = Math.max(maxValue,values.next().get());
				}*/

				output.collect(key,new IntWritable(sumTemps / numItems)); 
			}
	}