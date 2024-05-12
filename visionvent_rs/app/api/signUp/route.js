import { NextResponse } from "next/server";
import Researcher from "../../../models/researcherModel";

export async function POST(request) {
    const { email, password, role } = await request.json();
    if (!email || !password || !role) {
        return NextResponse.json({
            msg: "Provide all fields"
        }, {
            status: 400
        })
    }
    if (role === 'researcher') {
        const result = await Researcher.create({
            email: email,
            name: email
        })
        return NextResponse.json({
            result
        }, { status: 200 }
        )
    }
    return NextResponse.json({
        msg: "Invalid role"
    }, {
        status: 400
    })
}