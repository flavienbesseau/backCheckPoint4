const express = require("express");

const router = express.Router();
const { connection } = require("../config");

router.get("/", (req, res) => {
  connection.query("SELECT * from pupil", (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error getting pupils");
    } else {
      res.status(200).send(results);
    }
  });
});

router.post("/", (req, res) => {
  const {
    family_name,
    first_name,
    birth_date,
    parents_phone,
    fk_class_id,
  } = req.body;
  connection.query(
    "INSERT INTO pupil(family_name, first_name, birth_date, parents_phone, fk_class_id) VALUES(?, ?, ?, ?, ?)",
    [family_name, first_name, birth_date, parents_phone, fk_class_id],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error saving a pupil");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.put("/:id", (req, res) => {
  const idPupil = req.params.id;
  const newPupil = req.body;
  connection.query(
    "UPDATE pupil SET ? WHERE id = ?",
    [newPupil, idPupil],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error updating an pupil");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.delete("/:id", (req, res) => {
  connection.query(
    "DELETE FROM pupil WHERE id = " + req.params.id,
    (err, results) => {
      if (err) {
        res.status(500).send("Error deleting an class");
      } else {
        res.status(200).send("pupil deleted");
      }
    }
  );
});

module.exports = router;
