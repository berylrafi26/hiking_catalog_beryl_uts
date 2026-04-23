importScripts(
  "https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js",
);
importScripts(
  "https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js",
);

firebase.initializeApp({
  apiKey: "AIzaSyA7n7-5u2rs_tntvWGqOnIgVgejC40QJjw",
  authDomain: "hiking-apps.firebaseapp.com",
  projectId: "hiking-apps",
  messagingSenderId: "640156216613",
  appId: "1:640156216613:web:d5d2e3a74b6effb68cbecc",
});
const messaging = firebase.messaging();
messaging.onBackgroundMessage(function (payload) {
  console.log("Background message ", payload);
});
