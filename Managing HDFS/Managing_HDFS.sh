#! bin/bash

# make /data/small and /data/big directory 
hadoop fs -mkdir hdfs://localhost:9000/data/small
hadoop fs -mkdir hdfs://localhost:9000/data/big

#make sure war_and_peace.txt is in home directory of your hadoop_user 
hadoop fs -moveFromLocal /home/hduser/war_and_peace.txt hdfs://localhost:9000/data/small/war_and_peace.txt

#First make data directory and put weather data into it 
hadoop fs -put /home/hduser/data/ hdfs://localhost:9000/data/big

# report

hadoop dfsadmin -report 

#file system checking
#blocks:
hadoop fsck -blocks

#specific direcory

hadoop fsck /data/big

#Enter safemode

hdfs dfsadmin -safemode enter

#Leave safemode

hdfs dfsadmin -safemode leave

#done!