import mongoose from 'mongoose'

const investorSchema = mongoose.Schema({
    name: {
        required: true,
        trim: true,
        type: String,
    },
    uid: {
        required: true,
        trim: true,
        type: String,
    },
    email: {
        required: true,
        trim: true,
        type: String,
    },
    totalInvestment: {
        type: Number,
        default: 0,
        required: true,
    },
    investments : {
        trim: true,
        type: [{
            investmentId: {
                type: String
            }
        }],
    },
    domains : {
        trim: true,
        type: Array,
    },
    walletAmt : {
        trim: true,
        type: Number,
    }
})

const Investor = mongoose.models.Investor || mongoose.model('Investor', investorSchema)
export default Investor