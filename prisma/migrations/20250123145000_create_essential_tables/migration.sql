-- CreateEnum
CREATE TYPE "OrderStatus" AS ENUM ('PENDING', 'CANCELED', 'SHIPPED', 'DELIVERED', 'RETURNED', 'PICKUP');

-- CreateTable
CREATE TABLE "customers" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(100) NOT NULL,

    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "orders" (
    "id" TEXT NOT NULL,
    "customer_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "status" "OrderStatus" NOT NULL DEFAULT 'PENDING',

    CONSTRAINT "orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "price" DECIMAL(8,2) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order_items" (
    "id" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price" DECIMAL(8,2) NOT NULL,
    "orderId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "order_items_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_items" ADD CONSTRAINT "order_items_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_items" ADD CONSTRAINT "order_items_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
