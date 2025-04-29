const express = require('express');
const router = express.Router();
const bookController = require('../controllers/bookController');

// ✅ Add a new book
router.post('/', bookController.addBook); // This maps to /api/books

// ✅ Issue a book
router.post('/issue', bookController.issueBook);

// ✅ Return a book
router.put('/return', bookController.returnBook);

module.exports = router;
