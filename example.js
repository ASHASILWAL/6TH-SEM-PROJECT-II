var config = {
    // replace the publicKey with yours
    // "publicKey": "test_public_key_0b7467eafd714f518e0de06a3fba56f6",

    "publicKey": "test_public_key_0b7467eafd714f518e0de06a3fba56f6",
    "productIdentity": "1234567890",
    "productName": "Dragon",
    "productUrl": "http://gameofthrones.wikia.com/wiki/Dragons",
    "eventHandler": {
        onSuccess(payload) {
            // hit merchant api for initiating verfication
            console.log(payload);
        },
        onError(error) {
            console.log(error);
        },
        
    }
};

var checkout = new KhaltiCheckout(config);
var btn = document.getElementById("payment-button");
btn.onclick = function () {
    checkout.show({ amount: 1000 });
}