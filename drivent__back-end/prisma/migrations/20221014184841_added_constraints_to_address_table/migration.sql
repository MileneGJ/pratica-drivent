/*
  Warnings:

  - A unique constraint covering the columns `[cep,street,number]` on the table `Address` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Address_cep_street_number_key" ON "Address"("cep", "street", "number");
