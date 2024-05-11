// report title
// Description
// author - naame
// timestamp

import mongoose from "mongoose"

const reportSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    authorId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Employee",
        required: true
    },
}, { timestamps: true })

const Report = mongoose.models.Report || new mongoose.model("Report", reportSchema)

export default Report;