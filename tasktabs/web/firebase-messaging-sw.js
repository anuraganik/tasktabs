importScripts('https://www.gstatic.com/firebasejs/8.2.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.2.1/firebase-messaging.js');

firebase.initializeApp({
  apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
  authDomain: "tasktabs-auranik.firebaseapp.com",
  projectId: "tasktabs-auranik",
  storageBucket: "tasktabs-auranik.appspot.com",
  messagingSenderId: "40723457877",
  appId: "1:40723457877:web:d8bfb939719e264ca371dc",
  measurementId: "G-875SPF3YF5"
});

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function(payload) {
  console.log('Received background message ', payload);
  const notificationTitle = 'Background Message Title';
  const notificationOptions = {
    body: 'Background Message body.',
    icon: '/icons/Icon-192.png'
  };

  return self.registration.showNotification(notificationTitle, notificationOptions);
});

