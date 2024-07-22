const admin = require("firebase-admin");

// Update the path to point to the correct service account key file
const serviceAccount = require("./tasktabs-auranik-firebase-adminsdk-55r78-e017625454.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

// Example usage
const db = admin.firestore();
db.collection('test').add({
  test: 'This is a test'
}).then(docRef => {
  console.log('Document written with ID: ', docRef.id);
}).catch(error => {
  console.error('Error adding document: ', error);
});

