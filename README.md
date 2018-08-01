# Mapreduce_example(wordcount)

Hadoop Tutorial to understand the implementation of the standard wordcount example and learn how to run a simple wordcount program using mapreduce.

### Prerequisites

1.Hadoop Installation must be completed successfully.

2.Single node hadoop cluster must be configured and running.

## Hadoop WordCount operation occurs in 3 stages :

![WordCount+Example](https://s3.amazonaws.com/files.dezyre.com/images/Tutorials/MapReduce+Tutorial%E2%80%93Learn+to+implement+Hadoop+WordCount+Example/Hadoop+MapReduce+Tutorial_WordCount+Example.png)

1.Mapper Phase
2.Shuffle Phase
3.Reducer Phase

### Hadoop WordCount Example- Mapper Phase Execution:

The text from the input text file is tokenized into words to form a key value pair with all the words present in the input text file.
The key is the word from the input file and value is ‘1’.


### Hadoop WordCount Example- Shuffle Phase Execution:
After the map phase execution is completed successfully, shuffle phase is executed automatically wherein the key-value pairs generated in the map phase are taken as input and then sorted in alphabetical order.

### Hadoop WordCount Example- Reducer Phase Execution:

In the reduce phase, all the keys are grouped together and the values for similar keys are added up to find the occurrences for a particular word. It is like an aggregation phase for the keys generated by the map phase. The reducer phase takes the output of shuffle phase as input and then reduces the key-value pairs to unique keys with values added up.


### Web interfaces:

* https://blueyes:50070 -(web UI of the Namenode daemon)

* https://blueyes:8042 -(web UI of HDFS Namenode web interface)

* https://blueyes:50075 -(web UI of Datanode tasktracker(Nodemanager))



