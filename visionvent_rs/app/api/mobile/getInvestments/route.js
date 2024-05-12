import { NextResponse } from 'next/server'
import connectToDb from '../../../../lib/mongodb/mongodb';
import Investments from '../../../../models/investmentModel';

export async function POST(request) {

    await connectToDb();

    const body = await request.json();
    if (body.code)
        if (body.code !== "q!w@e#rt%y^u&")
            return NextResponse.json({
                msg: "Authentication required!!!"
            }, {
                status: 400
            })
    const investmentIds = body.investments;
    if (investmentIds.length === 0)
        return NextResponse.json({
            msg: "No investments found!!!"
        }, {
            status: 400
        })
    let investments = []
    try{
    investmentIds.map(async (iid) => {
        const investment = await Investments.find({ _id: iid })
        investments.push(investment)
    })
    return NextResponse.json({
        investments: investments,
    }, {
        status: 200
    })
} catch(error) {
    return NextResponse.json({
        error: error.message
    },{
        status:500
    })
}
}