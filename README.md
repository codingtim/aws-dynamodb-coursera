Week 1 

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html
managed nosql db
key/value db

table containing keys with attributes
partition key (unique)
partition with sort key (combination unique)

write multi AZ by default
read choose strong or eventual consistency 

max size is 400kb
partition min key length is 1byte max size 248byte

query: partition key has to be specified, sort key may be specified, optional filter can be applied
scan: loop all with optional filter

reduce data returned by using ProjectionExpression 

Local secondary index: only different sort key
Global secondary index: different partition key
There is no query optimizer so you have to specify which index to query or scan

Week 2

"When you create an on-demand backup, a time marker of the request is cataloged. The backup is created asynchronously by applying all changes until the time of the request to the last full table snapshot. Backup requests are processed instantaneously and become available for restore within minutes."

data stored in partition by paritition key
number of paritions changes if data grows or usage changes
partition key should be uniformly distributed and accessed equally
adaptive capacity is used to mitigate hot partition (exces provisioned capacity of less used partitions)
burst capacity allows spikes

BatchWriteItem put or delete multiple items to 1 or more tables, not atomic failures are returned
BatchGetItem retrieved in paralel, by default eventually consistent

Global secondary indexes have their own provisioned throughput (in provisioned mode)
Put/update/delete to a table also issues put/update/delete to the index
this consumes write capacity units from the index

Week 3

encryption through KMS
backups also encrypted
items are encrypted and attributes can be encrypted or signed

TTL: expired items still show up in search results, use filter to remove them, deleted within 48hours

Global Tables replicates accross Regions with Streams

Stream data is not stored in the DynamoDB Table, but separatel
Streams are accessed through different endpoint than Tables
Stream can contain old and new data
Information about transactions are lost?

To support Full Text Searching use Streams to push data to ES with a Lambda
https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-aws-integrations.html#es-aws-integrations-dynamodb-es

Week 4

Optimistic Locking with a Conditional Write 
PutItem only if not exists
UpdateItem only if attribute has specific value

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LSI.html
Secondary Index does not require partition key - sort key to be unique
Local SI can only be created at table creation time
Local SI can be read strongly or eventually consistent
Local SI always contains the base table sort key as attribute
Local SI can contains other projected attributes or can lookup attributes in base table (with scan??)

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.html
Global SI can be created later
Global SI is always eventually consistent
Global SI requires its own capacity unit in provision mode
Global SI always gets the base table partition key and sort key projected
Global SI can contains projected attributes but offset data cost vs required

Data in DynamoDB should be stored de-normalized and with the correct LSI to support all queries
Or even fully single-table and store multiple data sets in 1 table
https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-modeling-nosql-B.html

Ever growing data can use a table per Time Serie 
Example: sales data table per quarter or year 

DynamoDB Accelerator = pay for cache
