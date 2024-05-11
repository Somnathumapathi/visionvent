// Name,
// description,
// List researcher,
// List of researchpapers,
// Investment needed,
// Total investment,
// Total resources,
// Growth(manual),
// List investors,
// List domains
import mongoose from "mongoose";

const researchCenterSchema = new mongoose.Schema({
    researchCenterName: {
        type: String,
        required: true,
        unique: true,
    },
    description: {
        type: String,
        required: true,
    },
    researchers: {
        type: Array,
        required: false,
    },
    researchPapers: {
        type: Array,
        required: false,
    },
    investments : {
        trim: true,
        type: [{
            investmentId: {
                type: String
            }
        }],
    },
    investmentNeeded: {
        type: Number,
        required: true,
    },
    totalInvestment: {
        type: Number,
        required: false,
    },
    totalResources: {
        type: Array,
        required: true,
    },
    growth: {
        type: Number,
        required: false,
    },
    investors: {
        type: Array,
        required: false,
    },
    domains: {
        type: Array,
        required: true,
    },
});

const ResearchCenter = mongoose.models.ResearchCenter || new mongoose.model("ResearchCenter", researchCenterSchema)

export default ResearchCenter;