// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
  address public owner;
  address public receiver;
  uint256 public latestTransferTimestamp;
  event TransferInformation(address indexed from, address indexed to, uint256 value, uint256 timestamp);
  uint initialSupply = 2000 * (10 ** decimals());

  constructor() ERC20("AstanaItUniversity_Ansar", "ANS"){
    _mint(msg.sender, initialSupply);
    owner = msg.sender;
     }


    function transfer(address recipient, uint256 amount) public override returns (bool) {
        bool check = super.transfer(recipient, amount);
        if (check) {
            emit TransferInformation(msg.sender, recipient, amount, block.timestamp);
            latestTransferTimestamp = block.timestamp;
            receiver = recipient;
        }
        return check;
    }

     function latestTransferHumanReadable() external view returns (string memory) {
        return _timestampToString(latestTransferTimestamp);
    }

    function _timestampToString(uint256 timestamp) internal pure returns (string memory) {

        uint256 remainder = timestamp % 31536000;

        remainder = remainder % 86400;

        uint256 hour = remainder / 3600;

        remainder = remainder % 3600;

        uint256 minute = remainder / 60;

        uint256 second = remainder % 60;
        return string(abi.encodePacked(
            "Latest transfer timestamp: ",
            _uintToString(hour+6),
            ":",
            _uintToString(minute),
            ":",
            _uintToString(second)
        ));
    }

    function _uintToString(uint256 _num) internal pure returns (string memory) {
        if (_num == 0) {
            return "0";
        }
        uint256 temp = _num;
        uint256 i;
        while (temp != 0) {
            i++;
            temp /= 10;
        }
        bytes memory array = new bytes(2);
        if(i == 1){
                i++;
            }
        while (_num != 0) {
            i--;
            array[i] = bytes1(uint8(48 + uint256(_num % 10)));
            _num /= 10;
        }
        return string(array);
    }

    function getTransactionSender() public view returns (address){
      address sender = msg.sender;
      return sender;
    }

    function getTransactionReceiver() public view returns (address){
      return receiver;
    }

}
