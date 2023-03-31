var Parse = require('parse/node');
var onoff = require('onoff');
var Gpio = onoff.Gpio;

var LiveQueryClient = Parse.LiveQueryClient;
var client = new LiveQueryClient({
    applicationId: 'xuG1l3SQ6c25LgrWBvZC49Pyzf55DA7U6s5i1c0K',
    serverURL: 'attempt.back4app.io/',
    javascriptKey: 'fpDwKEgaDLBhZKJzqUSTKrVjkyVi6lO4QY9rRnwB'
})

let state = new Gpio(4,'out');
let output1 = new Gpio(17,'out');