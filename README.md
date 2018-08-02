# 1.Mapreduce_example(wordcount)

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



# 2.Test and Benchmark

![benchmarking](https://www.michael-noll.com/assets/uploads/hadoop-benchmarking-terasort-data-flow1-505x600.png)

1. TeraGen is a MapReduce program to generate the data.

2. TeraSort samples the input data and uses MapReduce to sort the data into a total
order.

3. TeraValidate is a MapReduce program that validates the output is sorted.
 
* To test the cluster's Processig capability we can run terasort.
Tipically we test our cluster on a terabyte or more data but since we didn't provision that much storage we do less.

### TeraGen

* TeraGen generates output data that is byte-for-byte equivalent to the C version, includ-
ing the newlines and specific keys. It divides the desired number of rows by the desired
number of tasks and assigns ranges of rows to each map. The map jumps the random
number generator to the correct value for the first row and generates the following rows.
For the final run, I configured TeraGen to use 1,800 tasks to generate a total of 10 billion
rows in HDFS, with a block size of 512 MB.

### TeraSort 

![TeraSort](http://blog.syncsort.com/wp-content/uploads/2013/05/Terasort-Benchmark-1.png)

* TeraSort is a standard MapReduce sort, except for a custom partitioner that uses a
sorted list of N−1 sampled keys that define the key range for each reduce. In particular,
all keys such that sample[i−1] <= key < sample[i] are sent to reduce i. This guarantees
that the output of reduce i are all less than the output of reduce i+1. To speed up the
partitioning, the partitioner builds a two-level trie that quickly indexes into the list of
sample keys based on the first two bytes of the key. TeraSort generates the sample keys
by sampling the input before the job is submitted and writing the list of keys into HDFS.

# 3.Managing HDFS


## Where to find data

* Download data from below links:

* [war and peace](http://www.gutenberg.org/files/2600/2600-0.txt)
* [Weatherdata](https://www.ncdc.noaa.gov/orders/qclcd/)  you can download any one .
* Make sure you put all this files in your home directory of hadoop_user if you are using hadoop on dedicated user.

### mkdir

This HDFS command takes path URI’s as an argument and creates directories.
* `hdfs dfs -mkdir /test`  OR
* `hadoop fs -mkdir /test`

Using fully qualified hdfs path:

*  `hadoop fs -mkdir hdfs://localhost:9000/data/small`
*  `hadoop fs -mkdir hdfs://localhost:9000/data/big`

###  ls

This Hadoop HDFS ls command displays a list of the contents of a directory specified by path provided by the user, showing the names, permissions, owner, size and modification date for each entry.
* `hdfs dfs -ls  /` OR
* `hadoop fs -ls  /`

This Hadoop fs command behaves like -ls, but recursively displays entries in all subdirectories of a path.
* `hadoop fs -ls -R /`  OR  `hdfs dfs -ls -R /`

### rm

This Hadoop command removes the file or empty directory present on the path provided by the user. 
*  `hdfs dfs -rm /test` OR `hadoop fs -rm  /test`

Recursive version of delete.
*  `hdfs dfs -rmr /test` OR `hadoop fs -rmr  /test`


###  moveFromLocal

This HDFS command copies the file or directory from the local file system identified by the local source to destination within HDFS, and then deletes the local copy on success.
*  `hdfs dfs -moveFromLocal  /home/hduser/war_and_peace.txt hdfs://localhost:9000/data/small/war_and_peace.txt`  OR 
* ` hadoop fs -moveFromLocal /home/hduser/war_and_peace.txt hdfs://localhost:9000/data/small/war_and_peace.txt`

### moveToLocal

This hadoop basic command works like -get, but deletes the HDFS copy on success.
*  `hadoop fs -moveToLocal  hdfs://localhost:9000/data/small/war_and_peace.txt /home/hduser/` OR
*  `hdfs dfs -moveToLocal  hdfs://localhost:9000/data/small/war_and_peace.txt /home/hduser/`

### copyFromLocal

This hadoop shell command is similar to put command, but the source is restricted to a local file reference.
* `hadoop fs -copyFromLocal  /home/hduser/war_and_peace.txt hdfs://localhost:9000/data/small/war_and_peace.txt`
* `hdfs dfs -copyFromLocal  /home/hduser/war_and_peace.txt hdfs://localhost:9000/data/small/war_and_peace.txt`

### copyToLocal

Similar to get command, only the difference is that in this the destination is restricted to a local file reference.
*  `hadoop fs -copyToLocal  hdfs://localhost:9000/data/small/war_and_peace.txt /home/hduser/` OR
*  `hdfs dfs -moveToLocal  hdfs://localhost:9000/data/small/war_and_peace.txt /home/hduser/` 

### put

This hadoop basic command copies the file or directory from the local file system to the destination within the DFS
Here data directory contains weather data 
*  `hadoop fs -put /home/hduser/data/ hdfs://localhost:9000/data/big` OR
* `hdfs dfs -put /home/hduser/data/ hdfs://localhost:9000/data/big`

### HDFS filesystem report

hdfs dfsadmin -report outputs a brief report on the overall HDFS filesystem. It’s a useful command to quickly view how much disk is available, how many DataNodes are running, corrupted blocks etc.[more](https://community.hortonworks.com/articles/98936/details-of-the-output-hdfs-dfsadmin-report.html)
*  ` hadoop dfsadmin -report ` OR ` hdfs dfsadmin -report`

HDFS supports the fsck command to check for various inconsistencies. It it is designed for reporting problems with various files, for example, missing blocks for a file or under-replicated blocks. Unlike a traditional fsck utility for native file systems, this command does not correct the errors it detects. Normally NameNode automatically corrects most of the recoverable failures. By default fsck ignores open files but provides an option to select all files during reporting. The HDFS fsck command is not a Hadoop shell command. It can be run as 'bin/hadoop fsck'.  fsck can be run on the whole file system or on a subset of files.

Check blocks: 
* `hadoop fsck -blocks` OR
Check specific directory 
* `hadoop fsck /data/big`

### Safemode 

Safemode in Apache Hadoop is a maintenance state of NameNode, during which NameNode doesn’t allow any modifications to the file system. In Safemode, HDFS cluster is in read-only and doesn’t replicate or delete Data Blocks.

* When NameNode starts:

It loads the file system namespace from the last saved FsImage into its main memory and the edits log file.
Merges edits log file on fsimage and results in new file system namespace.
Then it receives block reports containing information about block location from all datanodes. In SafeMode NameNode performs collection of block reports from datanodes. NameNode enters safemode automatically during its start up.
NameNode leaves Safemode after the DataNodes have reported that most blocks are available.

To enter Safemode, use command:
* `hdfs dfsadmin -safemode enter` OR `hadoop dfsadmin -safemode enter`

To come out of Safemode, use command:
* `hdfs dfsadmin -safemode enter leave` OR `hadoop dfsadmin -safemode leave`







 







