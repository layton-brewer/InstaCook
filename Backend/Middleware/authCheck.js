// Authentication middleware stub.
// In production, this should validate Clerk-issued JWTs or session tokens.

function requireAuth(req, res, next) {
  // Placeholder: accept a fake user id from header for now
  const userId = req.header('x-demo-user-id') || 'demo-user';
  req.user = { id: userId };
  next();
}

module.exports = { requireAuth };
