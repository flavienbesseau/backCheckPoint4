const express = require("express");

const router = express.Router();
const { connection } = require("../config");

router.get("/", (req, res) => {
  connection.query("SELECT * from class", (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error getting classes");
    } else {
      res.status(200).send(results);
    }
  });
});

router.post("/", (req, res) => {
  const { name } = req.body;
  connection.query(
    "INSERT INTO class(name) VALUES(?)",
    [name],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error saving a class");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.put("/:id", (req, res) => {
  const idClass = req.params.id;
  const newClass = req.body;
  connection.query(
    "UPDATE class SET ? WHERE id = ?",
    [newClass, idClass],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error updating an class");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.delete("/:id", (req, res) => {
  connection.query(
    "DELETE FROM class WHERE id = " + req.params.id,
    (err, results) => {
      if (err) {
        res.status(500).send("Error deleting an class");
      } else {
        res.status(200).send("Class deleted");
      }
    }
  );
});

module.exports = router;
