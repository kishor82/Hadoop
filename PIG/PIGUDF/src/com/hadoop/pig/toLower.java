package com.hadoop.pig;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class toLower extends EvalFunc<String>{

	public String exec(Tuple input) throws IOException{

		if (input == null || input.size() == 0)
			return null;
		try{
			Object obj = input.get(0);
			if(obj == null)
				return null;

			String str = (String) obj;
			return str.toLowerCase();
		}catch(Exception e){
			throw new IOException(e);
		}
	}
}