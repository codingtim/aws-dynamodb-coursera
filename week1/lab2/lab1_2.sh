aws dynamodb put-item --table-name dragons --item file://dragon1.json --profile my-account-power-user
aws dynamodb put-item --table-name dragons --item file://dragon2.json --profile my-account-power-user

aws dynamodb query --table-name dragons \
	--key-condition-expression "dragon_name = :name" \
	--expression-attribute-values '{":name": {"S": "tallie"}}' \
	--profile my-account-power-user
aws dynamodb scan --table-name dragons \
	--filter-expression "defense < :defense" \
	--expression-attribute-values '{":defense": {"N": "8"}}' \
	--profile my-account-power-user
