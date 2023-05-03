const express = require("express");

const router = express.Router();

const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

router.post("/", async (req, res) => {
  const user = await prisma.user.createMany({
    data: {
      name: req.body.name,
      email: req.body.email,
      password: req.body.password,
    },
  });
  res.status(201).send(user);
});
router.post("/login", async (req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  const user = await prisma.user.findUnique({ where: { email } });
  if (!user) {
    return res.status(401).send({ message: "Invalid email or password" });
  }
  const passwordMatch = password === user.password;
  if (!passwordMatch) {
    return res.status(401).send({ message: "Invalid email or password" });
  }
  res.status(200).send(user);
});
router.delete("/", async (req, res) => {
  const deleteData = await prisma.user.deleteMany();
  res.send("data deleted").status(200);
});
module.exports = router;
