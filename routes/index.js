const router = require("express").Router();

const authentification = require("./authentification");
const pupils = require("./pupils");
const teachers = require("./teachers");
const classes = require("./classes");

router.use("/authentification", authentification);
router.use("/pupils", pupils);
router.use("/teachers", teachers);
router.use("/classes", classes);

module.exports = router;
