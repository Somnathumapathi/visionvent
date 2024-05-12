import { NextResponse } from 'next/server'
import ResearchCenter from '../../../models/researchCenterModel';

export async function POST(request) {
    const body = await request.json();

    if (body.code) {
        if (body.code !== "q!w@e#rt%y^u&") {
            return NextResponse.json({
                msg: "Authentication required!!!"
            }, {
                status: 400
            })
        }
    }
    try {
        const result = await ResearchCenter.findOne({ uid: body.uid })
        return NextResponse.json({ result }, { status: 200 })
    } catch (error) {
        return NextResponse.json({
            error: error.message
        }, {
            status: 500
        })
    }
}