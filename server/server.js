const express = require("express");
const serveStatic = require("serve-static");
const path = require("path");
const bodyParser = require("body-parser");



var eserver = express();
var router = express.Router();
eserver.use(bodyParser.json());
eserver.use(bodyParser.urlencoded({ extended: true }));
eserver.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Token");
    next();
});

router.get("/", function (req, res) {
    res.json({ message: "The API is here." });
});

eserver.use("/", router);

eserver.listen(process.env.PORT || 3000, "0.0.0.0", function() {
    console.log("Server listening on port %d in %s mode", this.address().port, app.settings.env);
});


var eclient = express();
eclient.use(express.static("../client/dist/spa"))

eclient.listen(process.env.PORT || 4000, "0.0.0.0", function() {
    console.log("Client listening on port %d in %s mode", this.address().port, app.settings.env);
});
