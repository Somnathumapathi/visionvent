import { NextResponse } from "next/server";
import connectToDb from "../../../../lib/mongodb/mongodb";
import ResearchCenter from "../../../../models/researchCenterModel";

export async function GET() {
    await connectToDb()
    try {
        const result = await ResearchCenter.find()
        return NextResponse.json(result, { status: 200 })
    } catch (error) {
        return NextResponse.json({ error: error }, { status: 500 })
    }
}