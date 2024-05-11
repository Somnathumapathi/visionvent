import { NextResponse } from "next/server";
import Report from "../../../models/reportModel";

export async function POST(request) {

    const body = await request.json();

    if (body.code !== "q!w@e#rt%y^u&")
        return NextResponse.json({
            message: "Authentication required!!"
        }, {
            status: 401
        })

    const reportIds = body.reportIDs;

    if (reportIds.length === 0) {
        return NextResponse.json({
            message: "No reports found!!"
        }, {
            status: 404
        })
    }

    let reports

    reportIds.map(async (rid) => {
        const report = await Report.find({ _id: rid })
        reports.push(report)
    })
    return NextResponse.json({
        reports
    },{
        status:201
    })
    
}