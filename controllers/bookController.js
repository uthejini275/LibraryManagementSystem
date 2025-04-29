const db = require('../db');

// ✅ Add a New Book
exports.addBook = (req, res) => {
  const { title, author, isbn, barcode } = req.body;

  if (!title || !author || !isbn || !barcode) {
    return res.status(400).json({ message: 'All fields are required' });
  }

  const sql = `
    INSERT INTO books (title, author, isbn, barcode, status)
    VALUES (?, ?, ?, ?, 'available')
  `;

  db.query(sql, [title, author, isbn, barcode], (err, result) => {
    if (err) {
      console.error('Error adding book:', err);
      return res.status(500).json({ message: 'Database error', error: err.message });
    }

    res.status(201).json({
      message: 'Book added successfully',
      book_id: result.insertId,
      barcode: barcode
    });
  });
};

// ✅ Issue a Book
exports.issueBook = (req, res) => {
  const { barcode } = req.body;

  if (!barcode) {
    return res.status(400).json({ message: 'Barcode is required' });
  }

  const updateStatus = `
    UPDATE books SET status = 'issued'
    WHERE barcode = ? AND status = 'available'
  `;

  db.query(updateStatus, [barcode], (err, result) => {
    if (err) {
      console.error('Error issuing book:', err);
      return res.status(500).json({ message: 'Database error' });
    }

    if (result.affectedRows === 0) {
      return res.status(400).json({ message: 'Book not available or already issued' });
    }

    res.status(200).json({ message: 'Book issued successfully' });
  });
};

// ✅ Return a Book
exports.returnBook = (req, res) => {
  const { barcode } = req.body;

  if (!barcode) {
    return res.status(400).json({ message: 'Barcode is required' });
  }

  const updateStatus = `
    UPDATE books SET status = 'available'
    WHERE barcode = ? AND status = 'issued'
  `;

  db.query(updateStatus, [barcode], (err, result) => {
    if (err) {
      console.error('Error returning book:', err);
      return res.status(500).json({ message: 'Database error' });
    }

    if (result.affectedRows === 0) {
      return res.status(400).json({ message: 'Book not found or already available' });
    }

    res.status(200).json({ message: 'Book returned successfully' });
  });
};
