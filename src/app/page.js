<<<<<<< HEAD
import {response} from "express";
import api from './api.js';
const express = require('express');
const app = express ();
app.use(express.json());
const PORT = process.env.PORT || 3002;
app.listen(PORT, () => {
  console.log("Server Listening on PORT:", PORT);
});
app.get("/api", (request, response) => {
  const status = {"secret": "the cake is a lie"};

  response.send(status);
});

=======
>>>>>>> 2f07a4f3ed41a2f193f36f8e59484089ee5e3241
export default function Home() {
  return (
    <main>Hello world
    </main>
  )
}
api();