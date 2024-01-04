# AstanaITUniversity_Ansar ERC-20 Token Smart Contract

ANS is an ERC-20 token implemented in Solidity, extending the OpenZeppelin ERC20 standard. This contract improve the standard ERC-20 functionalities by features such as tracking the latest transfer timestamp and providing human-readable timestamp information.

## Usage

ERC-20 tokens represent digital assets that operate on the Ethereum blockchain, adhering to a set of predefined rules known as the ERC-20 standard. This standardized framework facilitates the creation and exchange of tokens within the Ethereum ecosystem. The popularity of ERC-20 tokens stems from their integration with the Ethereum network, enabling storage and transfer using Ethereum addresses and wallets.


![Consctrucor](https://github.com/qosyaq/ERC-20-Token/blob/main/constructor.png)

## Functions

### `transfer(address recipient, uint256 amount) public override returns (bool)`
Transfers tokens to the specified recipient and emits a `TransferInformation` event with details of the transaction, including sender, recipient, transferred amount, and timestamp.

![Transfer](https://github.com/qosyaq/ERC-20-Token/blob/main/func+transfer.png)

### `latestTransferHumanReadable() external view returns (string memory)`
Returns the latest transfer timestamp in a human-readable format (hour, minute, second).

![LastTransferHR](https://github.com/qosyaq/ERC-20-Token/blob/main/func+LatestTimestampHumanReadable.png)

### `getTransactionSender() public view returns (address)`
Returns the address of the sender of the transaction.
### `getTransactionReceiver() public view returns (address)`
Returns the address of the receiver in the latest transaction.

![Transfer](https://github.com/qosyaq/ERC-20-Token/blob/main/func+getTranSender_Reciever.png)

### Examples

For instance, the function "transfer" sends tokens to another address, you can also find out where the transfer came from and where to transfer. The last timestamp of the transaction is also saved.
