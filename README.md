# FastFeet App
#### management of orders from a carrier

### Application rules

* Two types of user: admin and delivery man
* Should be possible to log in with CPF and password
* CRUD for <br>
  -> delivery man <br>
  -> packages <br>
  -> recipients <br>
* should be possible to mark an order as "pending" (Available for pickup)
* should be possible to pickup an order
* should be possible to mark an order as "delivered"
* should be possible to mark an order as "returned"
* should be possible to list the orders with the destination address close to delivery man position
* should be possible to alter user password
* should be possible to list the user's orders
* should be possible to notify the recipient after each order status modification

### Business rules

* Only the "admin" user <br>
  -> can perform CRUD operations on orders <br>
  -> can perform CRUD operations on delivery men <br>
  -> can perform CRUD operations on recipients <br>
  -> can change the user's password <br>
* Delivery man should send a photo of the recipient to mark an order as "delivered"
* Only the delivery man that who picked up the order can mark it as "delivered"
* It should not be possible for a delivery man to list another delivery men's orders