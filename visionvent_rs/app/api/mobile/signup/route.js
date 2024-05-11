import { NextResponse } from 'next/server'
import connectToDb from '../../../../lib/mongodb/mongodb'
import Investor from '../../../../models/investor'

export async function POST(req) {
    try{
        const body = await req.json()
        // return NextResponse.json(await req.json());

    if(body.code !== "q!w@e#rt%y^u&")
        return NextResponse.json({"msg" : "No access"}, {status:400})
    
    const db = await connectToDb()

    let us = await Investor.findOne({ uid: body.uid })
    if(us)
        return NextResponse.json({msg: "User already exists"},{status:400})
    let investor = new Investor({
        uid: body.uid,
        name: body.name,
        email: body.email,
        investments: body.investments,
        domains: body.domains
    })
    investor = await investor.save()
    return NextResponse.json(investor, {status:200})
    // db.collection('investors').insertOne({})
     
    } catch (e) {
        return NextResponse.json({"error" : e.message},{status:500})
    }
}