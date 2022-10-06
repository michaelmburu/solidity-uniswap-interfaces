// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

/*
    Run With Injected Web3
*/

interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);

    function allPairs(uint256) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimeStampLast
        );
}

//Create a contract with addresses of the pair tokens
//Write a function to get the pair of tokens and set it to an address
// Use that address to get the reserve values and finally return the reserve values
contract MyContract {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getReserveTokens() external view returns (uint256, uint256) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint256 reserve0, uint256 reserve1, ) = UniswapV2Pair(pair)
            .getReserves();
        return (reserve0, reserve1);
    }
}
