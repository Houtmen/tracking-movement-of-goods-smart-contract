// Define the smart contract
pragma solidity ^0.8.0;

contract SupplyChain {
    // Define the variables
    struct Product {
        uint productId;
        string productName;
        uint productPrice;
        uint productQuantity;
        address productOwner;
        address productBuyer;
    }

    mapping (uint => Product) public products;
    uint public productCount;

    // Define the events
    event ProductCreated(uint productId, string productName, uint productPrice, uint productQuantity, address productOwner);
    event ProductBought(uint productId, address productBuyer);

    // Define the functions
    function createProduct(string memory _productName, uint _productPrice, uint _productQuantity) public {
        productCount++;
        products[productCount] = Product(productCount, _productName, _productPrice, _productQuantity, msg.sender, address(0));
        emit ProductCreated(productCount, _productName, _productPrice, _productQuantity, msg.sender);
    }

    function buyProduct(uint _productId) public payable {
        Product memory product = products[_productId];
        require(product.productId > 0 && product.productId <= productCount, "Invalid product ID");
        require(msg.sender != product.productOwner, "You can't buy your own product");
        require(msg.value == product.productPrice, "Invalid product price");
        require(product.productQuantity > 0, "Product out of stock");

        product.productQuantity--;
        product.productBuyer = msg.sender;
        products[_productId] = product;
        payable(product.productOwner).transfer(msg.value);
        emit ProductBought(_productId, msg.sender);
    }
}
