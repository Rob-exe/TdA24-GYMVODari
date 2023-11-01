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

export default function Home() {
  return (
    <main>Hello world
    </main>
  )
}
api();