const express = require('express');
const app = express();
const connectDb = require('./db/connect');
const PORT = 5000
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/api/users', require('./routes/user'));

app.listen(PORT, async () => {
    await connectDb();
    console.log(`http://localhost:${PORT}`);
})

