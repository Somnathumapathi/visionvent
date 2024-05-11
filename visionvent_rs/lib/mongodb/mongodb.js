import { MongoClient } from "mongodb";
import mongoose from "mongoose"

const connectToDb = async() => {
    try {
        await mongoose.connect(process.env.MONGODB_URI)
        console.log("Connected to mongoDB")
    } catch (err) {
        console.log(err)
    }
}

export default connectToDb;