import { NextResponse } from 'next/server'
import connectToDb from '../../../../lib/mongodb/mongodb';
import Investments from '../../../../models/investmentModel';

export async function POST(request) {

    await connectToDb();

    const body = await request.json();
    if (body.code !== "q!w@e#rt%y^u&")
        return NextResponse.json({
            message: "Authentication required!!!"
        }, {
            status: 401
        })
    const investmentIds = body.investments;
    if (investmentIds.length === 0)
        return NextResponse.json({
            message: "No investments found!!!"
        }, {
            status: 201
        })
    let investments = []
    investmentIds.map(async (iid) => {
        const investment = await Investments.find({ _id: iid })
        investments.push(investment)
    })
    return NextResponse.json({
        investments: investments,
    }, {
        status: 201
    })
}