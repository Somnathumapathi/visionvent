import { NextResponse } from 'next/server'
import connectToDb from '../../../../lib/mongodb/mongodb';
import Investments from '../../../../models/investmentModel';
import Investor from '../../../../models/investor';
import ResearchCenter from '../../../../models/researchCenterModel';

export async function POST(request) {

    await connectToDb();

    const body = await request.json();
    if (body.code) {
        if (body.code !== "q!w@e#rt%y^u&") {
            return NextResponse.json({
                message: "Authentication required!!!"
            }, {
                status: 400
            })
        }
    }

    let investments = []

    try {
        const newInvestment = await Investments.create({
            investorId: body.investorId,
            researchCenterId: body.researchCenterId,
            researchCenterName: body.researchCenterName,
            investedAmount: body.investedAmount,
            returns: body.returns,
        })

        let investorInvestments = (await Investor.findOne({ _id: body.investorId })).investments;
        investorInvestments.push({ investmentId: newInvestment._id })

        // Calculating total investments for the research center
        let totalInvestment = (await Investor.findOne({ _id: body.investorId })).totalInvestment;
        totalInvestment += body.investedAmount


        let companyInvestments = (await ResearchCenter.findOne({ _id: body.researchCenterId })).investments;

        companyInvestments.push({ investmentId: newInvestment })

        const updatedRCM = await ResearchCenter.findOneAndUpdate({ _id: body.researchCenterId }, { $set: { investments: companyInvestments, totalInvestment: totalInvestment } }, { new: true })

        const result = await Investor.findOneAndUpdate({ _id: body.investorId }, { $set: { investments: investorInvestments } }, { new: true })
        const investorInvestmentsList = (await Investor.findById(body.investorId)).investments;

        return NextResponse.json({
            investorInvestments: investorInvestmentsList
        }, {
            status: 200
        })

    } catch (error) {
        return NextResponse.json({
            error: error.message
        }, {
            status: 500
        })
    }

}