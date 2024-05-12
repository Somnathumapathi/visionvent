import mongoose from "mongoose";

const researcherSchema = new mongoose.Schema({
    name:{
        type: String,
        required: true
    },
    reports:{
        type: Array,
        required: false
    },
    email:{
        type: String,
        required: true
    }
})

const Researcher = mongoose.models.Researcher || mongoose.model("Researcher", researcherSchema)

export default Researcher