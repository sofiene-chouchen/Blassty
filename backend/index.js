const Express = require("express");

var app = Express();

app.use(Express.json());

app.listen(process.env.PORT, () => {
  console.log(`serveur run in port 5000`);
});
