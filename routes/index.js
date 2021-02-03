const router = require("express").Router();

const authentification = require("./authentification");

router.use("/authentification", authentification);

module.exports = router;
