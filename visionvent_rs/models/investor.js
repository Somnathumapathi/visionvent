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
        type: [{
            domains: {
                type: String
            }}
        ],
    }
})

const Investor = mongoose.models.Investor || mongoose.model('Investor', investorSchema)
export default Investor