// Entry point for the InstaCook backend API server
// Sets up Express, core middleware, and routes for auth, processing, generation, and recipes.

const express = require('express');
const morgan = require('morgan');
const cors = require('cors');

const authRoutes = require('./Routes/auth');
const processRoutes = require('./Routes/process');
const generateRoutes = require('./Routes/generate');
const recipesRoutes = require('./Routes/recipes');
const errorHandler = require('./Middleware/errorHandler');

const app = express();

app.use(cors());
app.use(express.json());
app.use(morgan('dev'));

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Core API routes
app.use('/auth', authRoutes);
app.use('/process', processRoutes);
app.use('/generate', generateRoutes);
app.use('/recipes', recipesRoutes);

// Centralized error handler
app.use(errorHandler);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`InstaCook API listening on port ${PORT}`);
});
