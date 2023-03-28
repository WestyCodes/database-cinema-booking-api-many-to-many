-- CreateTable
CREATE TABLE "Seat" (
    "id" SERIAL NOT NULL,
    "seatName" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Seat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ScreeningToSeat" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Seat_seatName_key" ON "Seat"("seatName");

-- CreateIndex
CREATE UNIQUE INDEX "_ScreeningToSeat_AB_unique" ON "_ScreeningToSeat"("A", "B");

-- CreateIndex
CREATE INDEX "_ScreeningToSeat_B_index" ON "_ScreeningToSeat"("B");

-- AddForeignKey
ALTER TABLE "_ScreeningToSeat" ADD CONSTRAINT "_ScreeningToSeat_A_fkey" FOREIGN KEY ("A") REFERENCES "Screening"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScreeningToSeat" ADD CONSTRAINT "_ScreeningToSeat_B_fkey" FOREIGN KEY ("B") REFERENCES "Seat"("id") ON DELETE CASCADE ON UPDATE CASCADE;
