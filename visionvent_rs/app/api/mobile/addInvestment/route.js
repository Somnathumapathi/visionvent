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

        const investor = await Investor.findOne({ _id: body.investorId });
        if(investor.walletAmt < 1){
            return NextResponse.json({
                msg: "Insufficient balance!"
            },{
                status: 400
            })
        }
        const investorInvestments = investor.investments
        investorInvestments.push({ investmentId: newInvestment._id })

        // Calculating total investments for the research center
        let totalI = {...investor}['_doc']['totalInvestment']
        // let totalI = temp.totalInvestment
        // let total = 0
        const total = totalI + body.investedAmount

        let wallet = investor.walletAmt
        wallet = wallet - body.investedAmount

        // console.log(temp.walletAmt)

        let researchCenter = await ResearchCenter.findOne({ _id: body.researchCenterId })

        let currentI = {...researchCenter}['_doc']['totalInvestment']

        currentI = currentI + body.investedAmount;

        let companyInvestments = researchCenter.investments;

        companyInvestments.push({ investmentId: newInvestment })

        const updatedRCM = await ResearchCenter.findOneAndUpdate({ _id: body.researchCenterId }, { $set: { investments: companyInvestments, totalInvestment: currentI } }, { new: true })

        const result = await Investor.findOneAndUpdate({ _id: body.investorId }, { $set: { investments: investorInvestments, totalInvestment: total, walletAmt: wallet } }, { new: true })
        const investorInvestmentsList = (await Investor.findById(body.investorId)).investments;

        return NextResponse.json({
            investorInvestments: investorInvestmentsList,
            walletBalance: wallet,
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