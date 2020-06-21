aws dynamodb create-table --table-name dragons \
	--key-schema AttributeName=dragon_name,KeyType=HASH \
	--attribute-definitions AttributeName=dragon_name,AttributeType="S" \
	--billing-mode PAY_PER_REQUEST \
	--profile my-account-power-user
