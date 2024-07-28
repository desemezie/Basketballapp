const express = require('express'); //import the express library 
const app = express();//initialize express app 
const stripe = require('stripe')('your-secret-key'); // importing stripe

app.use(express.json());


app.get('/', (req, res) => { //action taken upon received get request from a client
  res.send('Hello World!');
});



app.listen(3000, () => { // server listens on 3000 port
  console.log('Server running on port 3000');
});

