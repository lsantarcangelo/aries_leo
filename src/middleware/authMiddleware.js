function authMiddleware(req, res, next) {
	if (!req.session.userLogged) {
		return res.redirect('../src/views/users/login');
	}
	next();
}

module.exports = authMiddleware;