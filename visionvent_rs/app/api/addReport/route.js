import { NextResponse } from 'next/server'
import Report from '../../../models/reportModel';

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
        const result = await Report.create({
            title: body.title,
            description: body.description,
            authorId: body.authorId
        })
        return NextResponse.json({
            message: "Report created successfully",
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