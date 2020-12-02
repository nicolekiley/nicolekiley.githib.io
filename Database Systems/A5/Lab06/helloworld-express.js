//jshint esversion: 7

// Setup express
const express = require('express');
const app = express();

// Create a default route
app.get('/', (req, res) =>
    res.send('Hello World'));

// Create a named route
app.get('/alien', (req, res) =>
res.send('Hello from an Alien World'));

// Define IP and port constants
const listenIP = 'localhost';
const listenPort = 3200;

// Setup express to listen on the specified IP and port
app.listen(listenPort, listenIP, () =>
    console.log('App listening on ' + listenIP + ':' + listenPort));
