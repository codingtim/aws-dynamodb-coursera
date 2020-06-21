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


