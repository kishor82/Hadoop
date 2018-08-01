#! bin/bash

#start hadoop 

star-all.sh

#OR

#start-dfs.sh and start-yarn.sh

#Check running Hadoop services
jps

#hadoop home directory

cd $HADOOP_HOME

#create directory in hdfs(hadoop file system):

hadoop fs -mkdir /data

#copy local file to hdfs (I assumed that you alreday created file in your local home directory with data.txt)

hadoop fs -copyFromLocal usr/hduser/data.txt  /data

#mapreduce-part

hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar wordcount /data/data.txt  /data/results

#check results 

hadoop fs -cat /data/results/part-r-00000