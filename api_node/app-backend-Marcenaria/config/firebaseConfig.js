// firebaseConfig.js
const admin = require('firebase-admin');
const config = require('./config'); // Importe o arquivo de configuração

const serviceAccount = require(config.firebaseServiceAccountPath);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const messaging = admin.messaging();
module.exports = messaging;