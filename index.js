const express = require("express");
const connection = require("./config");
const cors = require("cors");

const api = require("./routes");

const port = 5000;

const app = express();

app.use(
  cors({
    origin: ["http://localhost:3000", process.env.FRONTEND_BASE_URL],
    credentials: true,
  })
);

app.get("/", (req, res) => {
  res.status(200).send("Server running 🚀");
});

app.use(express.json());
app.use("/api", api);

app.listen(port, () => {
  console.log(`Server is runing on ${port}`);
});
