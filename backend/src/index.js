// Basic Express server setup
const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Routes placeholder
app.get('/', (req, res) => {
  res.send('Flow Bounty Platform API');
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});