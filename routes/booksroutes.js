const express = require('express');
const router = express.Router();
const bookController = require('../controllers/bookController'); // Correct import

// ✅ Route: Add a new book (handled in controller)
router.post('/', bookController.addBook);

// ✅ Route: Search for books (inline here)
router.get('/search', (req, res) => {
  const db = require('../db'); // Only needed here
  const query = req.query.query;
  if (!query) return res.status(400).json({ message: 'No query provided' });

  const likeQuery = `%${query}%`;
  const sql = `SELECT * FROM books WHERE title LIKE ? OR author LIKE ? OR isbn LIKE ?`;

  db.query(sql, [likeQuery, likeQuery, likeQuery], (err, result) => {
    if (err) {
      console.error('Error searching books:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    res.status(200).json({ books: result });
  });
});

module.exports = router;
