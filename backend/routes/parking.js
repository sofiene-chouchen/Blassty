const express = require("express");

const route = express.Router();

const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

route.post("/", async (req, res) => {
  const data = await prisma.parking.createMany({
    data: {
      name: req.body.name,
      lat: req.body.lat,
      long: req.body.long,
      price: req.body.price,
      nbPlace: req.body.place,
    },
  });
  res.status(201).status("created");
});

route.get("/", async (req, res) => {
  const data = await prisma.parking.findMany();
  res.status(200).send(data);
});

module.exports = route;
