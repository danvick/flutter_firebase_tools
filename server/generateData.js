var faker = require('faker');
const { fake } = require('faker');

var database = { products: [] };

for (var i=1; i<=100; i++) {
  database.products.push({
    id: i,
    name: faker.commerce.productName(),
    cost: faker.commerce.price(),
    quantity: faker.random.number(),
    imageUrl: faker.image.imageUrl()
  });
}

console.log(JSON.stringify(database));
