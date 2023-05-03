const Express = require("express");
var user = require("./routes/user");
var parking = require("./routes/parking");
var app = Express();

app.use(Express.json());

app.use("/user", user);
app.use("/parking", parking);

app.listen(process.env.PORT, () => {
  console.log(`serveur run in port 5000`);
});
