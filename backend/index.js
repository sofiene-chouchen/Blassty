const Express = require("express");
var user = require("./routes/user");
var app = Express();

app.use(Express.json());

app.use("/user", user);

app.listen(process.env.PORT, () => {
  console.log(`serveur run in port 5000`);
});
