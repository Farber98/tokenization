# Foundry commands

Init repo: forge init --force --no-commit

Build sc: forge build

Run tests: forge test -vvv

Install Open Zeppelin libs: forge install openzeppelin/openzeppelin-contracts

Reload .env: source .env

Deploy: forge script script/Deploy.sol:DeploymentScript --broadcast --verify --rpc-url ${GOERLI_RPC_URL}
