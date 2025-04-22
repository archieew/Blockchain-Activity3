// SPDX-License-Identifier: HAU

pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

    contract MyMultiToken is ERC1155, Ownable {
        uint256 public GOLD = 1;
        uint256 public SILVER = 2;
        uint256 public DIAMOND = 3;
        bool public isMintEnabled;
        mapping(address => uint256) public mintedWallets;

        constructor() ERC1155("https://mygame.io/api/item/{id}.json") Ownable(msg.sender) {
        _mint(msg.sender, GOLD, 1000, "");
        _mint(msg.sender, SILVER, 5000,  "");
        _mint(msg.sender, DIAMOND, 100, "");
        }

        function mint(
                address to, uint256 id,
                uint256 amount
            ) external onlyOwner {
                _mint(to, id, amount, "");
            }
        
        function burn(
            address from,
            uint256 id,
            uint256 amount
        ) external {
            require(from == msg.sender, "You can only burn your own tokens");
            _burn(from, id, amount);
        }
        
    }


