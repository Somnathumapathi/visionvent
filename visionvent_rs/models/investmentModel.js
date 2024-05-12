import mongoose from "mongoose";

const investmentSchema = new mongoose.Schema({
    investorId: {
        type: mongoose.Schema.Types.ObjectId,
        required: true
    },
    researchCenterId: {
        type: mongoose.Schema.Types.ObjectId,
        required: true
    },
    researchCenterName:{
        type: String,
        required: true
    },
    investedAmount: {
        type: Number,
        required: true
    },
    returns: {
        type: Number,
        required: false,
        default: 0
    }
})

const Investments = mongoose.models.Investments || mongoose.model("Investments", investmentSchema)

export default Investments