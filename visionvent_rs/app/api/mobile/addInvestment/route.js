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
                status: 401
            })
        }
    }

    let investments = []

    try {
        const newInvestment = await Investments.create({
            investorId: body.investorId,
            companyId: body.researchCenterId,
            investedAmount: body.investedAmount,
        })

        let investorInvestments = (await Investor.findOne({ _id: body.companyId })).investments;

        investorInvestments.push({ investmentId: newInvestment._id })

        let companyInvestments = (await ResearchCenter.findOne({ _id: body.companyId })).investments;

        companyInvestments.push({ investmentId: newInvestment })

        const updatedRCM = await ResearchCenter.findOneAndUpdate({ _id: companyId }, { $set: { investments: companyInvestments } }, { new: true })

        const result = await Investor.findOneAndUpdate({ _id: customerId }, { $set: { investments: investorInvestments } }, { new: true })
        const investorInvestmentsList = (await Investor.findById(customerId)).investments;

        return NextResponse.json({
            message: "Investment created successfully!!!",
            investorInvestments: investorInvestmentsList
        }, {
            status: 201
        })

    } catch (error) {
        return NextResponse.json({
            error: error.message
        }, {
            status: 400
        })
    }

}