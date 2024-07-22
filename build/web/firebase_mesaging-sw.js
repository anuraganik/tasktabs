// Give the service worker access to Firebase Messaging.
importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging.js');

// Initialize the Firebase app in the service worker by passing in the messagingSenderId.
firebase.initializeApp({
  apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
  authDomain: "tasktabs-auranik.firebaseapp.com",
  projectId: "tasktabs-auranik",
  storageBucket: "tasktabs-auranik.appspot.com",
  messagingSenderId: "40723457877",
  appId: "1:40723457877:web:d8bfb939719e264ca371dc",
  measurementId: "G-875SPF3YF5"
});

// Retrieve an instance of Firebase Messaging so that it can handle background messages.
const messaging = firebase.messaging();

messaging.onBackgroundMessage(function(payload) {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);
  // Customize notification here
  const notificationTitle = 'TaskTabs Background Notification';
  const notificationOptions = {
    body: payload.notification.body,
    icon: payload.notification.icon
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});

