// jshint esversion: 7

let mysql = require('mysql2');
let dbInfo = require('./dbInfo.js');
let express = require('express');
let bodyParser = require("body-parser");

let app = express();

// Add static route for non-Node.js pages
app.use(express.static('public'));

// Configure body parser for handling post operations
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Get events
app.get('/events/:event_id?', function (req, res) {
   console.log("Route /events GET", req.params);
   let data = [];
   let sql = "SELECT * FROM events";
   if (req.params.event_id != undefined) {
      sql += " WHERE event_id = ?";
      data = [req.params.event_id];
      // Object technique:
      // sql += " WHERE ?";
      // data = req.params;
      console.log(data);
   } else {
      sql += " ORDER BY event_name";
   }
   console.log("SQL", sql);
   connection.query(sql, data,
      function (errQuery, rows) {
         if (errQuery) {
            console.log(errQuery);
            res.json({rows: [], err: errQuery});
         } else if (rows) {
            console.log("Rows returned", rows.length);
            res.json({rows: rows, err: ""});
         } else {
            console.log("No event rows...\n");
            res.json({rows: [], err: ""});
         }
      }
   );
});

// Add event
app.post('/events', function (req, res) {
   console.log("Route /events POST");
   let data = {event_id: req.body.event_id,
    event_name: req.body.event_name,
    event_datetime: req.body.event_datetime,
    other_details: req.body.other_details};
   connection.query("INSERT INTO events SET ?",
      data,
      function (errQuery, result) {
         if (errQuery) {
            console.log(errQuery);
            res.json({status: "Error", err: errQuery});
         } else {
            console.log("Insert ID: ", result.insertId);
            res.json({status: result.insertId, err: ""});
         }
      }
   );
});

// Delete event
app.delete('/events/:event_id?', function (req, res) {
   console.log("Route /events DELETE");
   let sql = "DELETE FROM events WHERE event_id = ?";
   // Object technique:
   // let sql = "DELETE FROM events WHERE ?";
   if (req.params.event_id != undefined) {
      let data = [req.params.event_id];
      // Object technique:
      // let data = {COLOR_ID: req.params.COLOR_ID};
      connection.query(sql,
         data,
         function (errQuery, result) {
            if (errQuery) {
               console.log(errQuery);
               res.json({status: "Error", err: errQuery});
            } else {
               console.log("Deleted");
               res.json({status: "Deleted", err: ""});
            }
         }
      );
   } else {
      let s = "Invalid or missing event_id";
      console.log(s);
      res.json({status: "Error", err: s});
   }
});

// Update events
app.put('/events', function (req, res) {
   console.log("Route /events PUT");
   let data = [{event_name: req.body.color, event_datetime: req.body.hex}, req.body.id];
   connection.query("UPDATE COLOR SET ? WHERE event_id=?",
      data,
      function (errQuery, result) {
         if (errQuery) {
            console.log(errQuery);
            res.json({status: "Error", err: errQuery});
         } else {
            console.log("Updated ID: ", req.body.id, ", Affected Rows: ", result.affectedRows);
            res.json({status: req.body.id, err: "", message: "Row updated"});         }
      }
   );
});

// Use NodeJS as our web server, needed to prevent cross origin (CORS) error
// typically seen on Chrome
app.get('/color.css', function(req, res) {
   res.sendFile(__dirname + '/color.css');
});

app.get('/color.html', function(req, res) {
   res.sendFile(__dirname + '/color.html');
});

app.get('/color.js', function(req, res) {
   res.sendFile(__dirname + '/color.js');
});

// Handle missing pages requested using GET HTTP verb
app.get('*', function(req, res) {
   res.status(404).send('Sorry that page does not exist');
});

// Create database connection
console.log('Creating connection...\n');
let connection = mysql.createConnection({
   host: dbInfo.dbHost,
   port: dbInfo.dbPort,
   user: dbInfo.dbUser,
   password: dbInfo.dbPassword,
   database: dbInfo.dbDatabase
});
// Connect to database
connection.connect(function(err) {
   console.log('Connecting to database...\n');

   // Handle any errors
   if (err) {
      console.log(err);
      console.log('Exiting application...\n');
   } else {
      console.log('Connected to database...\n');
      // Listen for connections
      // Note: Will terminate with an error if database connection
      // is closed
      const ip = 'localhost';
      const port = 8080;
      app.listen(port, ip, function () {
         try {
            console.log('Color server app listening on port ' + port);
         } catch (err) {
            console.log(err);
         }
      });
   }
});
