import { MongoClient } from "mongodb";

const connectToDb = async() => {
    try {
        await mongoose.connect(process.env.MONGODB_URI)
        console.log("Connected to mongoDB")
    } catch (err) {
        console.log(err)
    }
}

export default connectToDb;