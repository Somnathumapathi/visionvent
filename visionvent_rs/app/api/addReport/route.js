import { NextResponse } from 'next/server'
import Report from '../../../models/reportModel';

export async function POST(request) {
    const body = await request.json();

    if (body.code) {
        if (body.code !== "q1w2e3r4t5y6u7") {
            return NextResponse.json({
                message: "Authentication required!!!"
            }, {
                status: 400
            })
        }
    }
    try {
        const result = await Report.create({
            title: body.title,
            description: body.description,
            authorId: body.authorId
        })
        return NextResponse.json({
            message: "Report created successfully",
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