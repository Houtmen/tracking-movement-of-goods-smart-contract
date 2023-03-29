# Supply Chain Smart Contract
This smart contract is a simple implementation of a supply chain on the Ethereum blockchain using the Solidity programming language. It allows the creation and purchase of products by users on the blockchain.

## Features
### Product Creation
Users can create a new product by calling the createProduct() function, passing in the required arguments: product name, product price and product quantity. A new product is added to the products mapping with a unique ID, and an event is emitted to notify listeners.

### Product Purchase
Users can buy a product by calling the buyProduct() function, passing in the ID of the product they want to buy. The function checks that the product ID is valid, the buyer is not the owner of the product, the price is correct, and the product is still in stock. If all conditions are met, the product quantity is decreased, the buyer address is saved, and the payment is transferred to the owner of the product. An event is emitted to notify listeners of the purchase.

## Usage
Deploy the smart contract on the Ethereum blockchain using a Solidity compiler, and interact with it through a web3 enabled browser or other compatible application.

## License
This code is licensed under the MIT License.
