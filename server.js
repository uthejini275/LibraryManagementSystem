const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const bodyParser = require('body-parser');

dotenv.config();
const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// DB
require('./db');

// Auth Routes
const authRoutes = require('./routes/auth');
app.use('/api/auth', authRoutes);

// Book Routes
const bookRoutes = require('./routes/book');
app.use('/api/book', bookRoutes);

// Books Search Routes - Corrected
const booksroutes = require('./routes/booksroutes'); // Ensure path and name match
app.use('/api/books', booksroutes); // Correct usage of booksRoutes

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
