// config/config.js
require('dotenv').config(); // Garante que as variáveis de ambiente sejam carregadas

module.exports = {
  firebaseServiceAccountPath: process.env.FIREBASE_SERVICE_ACCOUNT_PATH || './push-ivi-moveis-planejados-firebase-adminsdk-fbsvc-aa05872414.json'
};