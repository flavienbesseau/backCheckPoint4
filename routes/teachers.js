const express = require("express");

const router = express.Router();
const { connection } = require("../config");

router.get("/", (req, res) => {
  connection.query("SELECT * from teacher", (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error getting teachers");
    } else {
      res.status(200).send(results);
    }
  });
});

router.post("/", (req, res) => {
  const { family_name, first_name, discipline } = req.body;
  connection.query(
    "INSERT INTO teacher(family_name, first_name, discipline) VALUES(?, ?, ?)",
    [family_name, first_name, discipline],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error saving a teacher");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.put("/:id", (req, res) => {
  const idTeacher = req.params.id;
  const newTeacher = req.body;
  connection.query(
    "UPDATE teacher SET ? WHERE id = ?",
    [newTeacher, idTeacher],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error updating a teacher");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.delete("/:id", (req, res) => {
  connection.query(
    "DELETE FROM teacher WHERE id = " + req.params.id,
    (err, results) => {
      if (err) {
        res.status(500).send("Error deleting an teacher");
      } else {
        res.status(200).send("teacher deleted");
      }
    }
  );
});

module.exports = router;
