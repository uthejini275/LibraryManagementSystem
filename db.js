
const mysql = require("mysql");
const dotenv = require("dotenv");
dotenv.config();

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "Uthejini#333", // or your password
    database: "library_management",
});

connection.connect((err) => {
  if (err) {
    console.error("❌ Database connection failed: ", err);
  } else {
    console.log("✅ Connected to MySQL database");
  }
});

module.exports = connection;
