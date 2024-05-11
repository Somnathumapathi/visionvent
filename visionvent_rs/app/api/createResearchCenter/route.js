import { NextResponse } from 'next/server'
import ResearchCenter from '../../../models/researchCenterModel';

export async function POST(request) {
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
    try {
        const result = await ResearchCenter.create({
            name: body.name,
            description: body.description,
            // researchers: body.researchers
            investmentNeeded: body.investmentNeeded,
            totalResources: body.totalResources,
            domains: body.domains
        })
        return NextResponse.json({
            message: "Research Center created successfully",
            result: result
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