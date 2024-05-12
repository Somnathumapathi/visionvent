import { NextResponse } from 'next/server'
import connectToDb from '../../../../lib/mongodb/mongodb'
import Investor from '../../../../models/investor'

export async function POST(req:any) {
    try{
        const body = await req.json()
        // return NextResponse.json(await req.json());

    if(body.code !== "q!w@e#rt%y^u&")
        return NextResponse.json({"msg" : "No access"}, {status:400})
    
    await connectToDb()

    let investor = await Investor.findOne({ uid: body.uid }) || await Investor.findById(body.investorId)
    console.log({...investor}['_doc']['totalInvestment']);
    if(!investor)
        return NextResponse.json({msg: "User does not exist, Singup first"},{status:400})
    
    return NextResponse.json(investor, {status:200})
     
    } catch (e:any) {
        return NextResponse.json({"error" : e.message},{status:500})
    }
}