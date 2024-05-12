import { NextResponse } from 'next/server'
import ResearchCenter from '../../../models/researchCenterModel';

export async function POST(request) {
    const body = await request.json();

    if (body.code) {
        if (body.code !== "q1w2e3r4t5y6u7") {
            return NextResponse.json({
                msg: "Authentication required!!!"
            }, {
                status: 400
            })
        }
    }
    try {
        const result = await ResearchCenter.create({
            researchCenterName: body.researchCenterName,
            description: body.description,
            // researchers: body.researchers
            investmentNeeded: body.investmentNeeded,
            totalResources: body.totalResources,
            domains: body.domains
        })
        return NextResponse.json({
            msg: "Research Center created successfully",
            result: result
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