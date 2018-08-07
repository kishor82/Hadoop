--Register custom .jar containing UDF
REGISTER /home/kishor/PIGUDFs.jar

--Load HDFS data into relation
book = LOAD 'hdfs:/data/small/war_and_peace.txt' USING PigStorage() AS (lines:chararray);

--Break up lines into words
words = FOREACH book  GENERATE FLATTEN(TOKENIZE(lines)) as word;

--call custom UDF to send all words to lowercase
wordsLower = FOREACH words GENERATE com.hadoop.pig.toLower(word);

--Group words
wordsGrouped = GROUP wordsLower BY $0;

--Aggregate words
wordsAggregated =  FOREACH wordsGrouped GENERATE group as word, COUNT(wordsLower) as wordcount;

--Sort aggregated words
wordsSorted = ORDER wordsAggregated BY wordcount DESC;

--Store Sorted results into HDFS
STORE wordsSorted INTO 'hdfs:/data/small/pigresults2';