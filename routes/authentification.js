const express = require("express");

const router = express.Router();
const { connection } = require("../config");

router.post("/register", (req, res) => {
  const { pseudo, password } = req.body;
  connection.query(
    "INSERT INTO manager(pseudo, password) VALUES(?, ?)",
    [pseudo, password],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error saving a user");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/", (req, res) => {
  connection.query("SELECT * from manager", (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error saving a user");
    } else {
      res.status(200).send(results);
    }
  });
});

module.exports = router;
