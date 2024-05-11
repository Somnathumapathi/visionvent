import { NextResponse } from "next/server";
import Report from "../../../models/reportModel";

export async function POST(request) {

    const body = await request.json();

    if (body.code !== "q!w@e#rt%y^u&")
        return NextResponse.json({
            msg: "Authentication required!!"
        }, {
            status: 400
        })

    const reportIds = body.reportIDs;

    if (reportIds.length === 0) {
        return NextResponse.json({
            msg: "No reports found!!"
        }, {
            status: 400
        })
    }

    let reports

    try {
        reportIds.map(async (rid) => {
            const report = await Report.find({ _id: rid })
            reports.push(report)
        })
        return NextResponse.json({
            reports
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