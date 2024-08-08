# CCIP Bootcamp Exercise 2: Build Your First Cross-Chain NFT

For this exercise, we deployed a cross-chain NFT contract on Sepolia and Arbitrum Sepolia, minted and transferred! See the official walkthrough [here](https://cll-devrel.gitbook.io/ccip-bootcamp/day-2/exercise-2-build-your-first-cross-chain-nft).

Below you can see how I did it using Foundry!

## Walkthrough

1. [Deploy](https://sepolia.etherscan.io/tx/0x3324fab2e6712074a4611bb0ae3699fdf2a349d8c722bc6058b90f15e719ffde) the [contract](https://sepolia.etherscan.io/address/0xb382af264298f48d17bf5c5a92486c3237b73314#code) on Sepolia:

  ```bash
  forge script ./script/XNFT.s.sol:DeployXNFT -vvv --broadcast --rpc-url ethereumSepolia --verify --etherscan-api-key $ETHERSCAN_API_KEY 
  ```

2. [Deploy](https://sepolia.arbiscan.io/tx/0xc62c7cc1abd43c4f091772284099bad05e30f302e58eac6aba811d2c584c049e) the [contract](https://sepolia.arbiscan.io/address/0x3C0Add1316010354D27395F4c5F652502596cAfe) on Arbitrum Sepolia:

  ```bash
  forge script ./script/XNFT.s.sol:DeployXNFT -vvv --broadcast --rpc-url arbitrumSepolia --verify --etherscan-api-key $ARBISCAN_API_KEY 
  ```

3. Call `enableChain()` on both contracts to allow the transfer of the xNFT between both chains:

  [Sepolia](https://sepolia.etherscan.io/tx/0x0c0a36037e9c09598c0df1c92067a202e3f5ec704ddab8a963ba8d643d4a5fad):

  ```bash
  cast send 0xB382AF264298f48D17bF5C5A92486c3237b73314  --rpc-url ethereumSepolia --private-key=$PRIVATE_KEY "enableChain(uint64,address,bytes)" $ARB_SEPOLIA_CHAIN_SELECTOR 0xB382AF264298f48D17bF5C5A92486c3237b73314 0x97a657c90000000000000000000000000000000000000000000000000000000000030d40
  ```

  [Arbitrum Sepolia](https://sepolia.arbiscan.io/tx/0x51350be4777130c6d5162e3af03efeebf6e4e0afc72e07583df501e5e17eb76d):

  ```bash
  cast send 0x3C0Add1316010354D27395F4c5F652502596cAfe --rpc-url arbitrumSepolia --private-key=$PRIVATE_KEY "enableChain(uint64,address,bytes)" $SEPOLIA_CHAIN_SELECTOR 0x3C0Add1316010354D27395F4c5F652502596cAfe 0x97a657c90000000000000000000000000000000000000000000000000000000000030d40
  ```

4. [Fund](https://sepolia.arbiscan.io/tx/0x6162ce0f9ca3bf7114d8f732362a3ad7c22dd38df2a30ec09b11a253c6e6f923) the Arbitrum Sepolia contract with 3 LINK and [mint](https://sepolia.arbiscan.io/tx/0xc6a703d2b5e0e5b52e379408bfb4e45c926e02302a33f0c00cd486579b190f5c) the xNFT:

  ```bash
  cast send 0x3C0Add1316010354D27395F4c5F652502596cAfe  --rpc-url arbitrumSepolia --private-key=$PRIVATE_KEY "mint()"
  ```

5. [Transfer](https://sepolia.arbiscan.io/tx/0xd3df49917473e8cb17c58115979fba8eaff666904424ce7d17f9bc605015d72e) the xNFT cross-chain to Sepolia:

  ```bash
  cast send 0x3C0Add1316010354D27395F4c5F652502596cAfe   --rpc-url arbitrumSepolia --private-key=$PRIVATE_KEY "crossChainTransferFrom(address,address,uint256,uint64,uint8)" 0x31e0FacEa072EE621f22971DF5bAE3a1317E41A4 0x31e0FacEa072EE621f22971DF5bAE3a1317E41A4 0 $SEPOLIA_CHAIN_SELECTOR 1
  ```

The successful transfer of the xNFT can be viewed on [CCIP Explorer](https://ccip.chain.link/msg/0x58eba311e06821c6563f7aecb2700e4c43e19e611f0fdefa06cddbe504017542).
