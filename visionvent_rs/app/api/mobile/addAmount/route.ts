import { NextResponse } from "next/server";
import Investor from "../../../../models/investor";

export async function POST(req:any) {
    try {
        const body = await req.json()
        if(body.code !== "q!w@e#rt%y^u&")
            return NextResponse.json({"msg" : "No access"}, {status:400})
        let user = await Investor.findOne({_id: body.id})
        if(!user.walletAmt)
            return NextResponse.json({user}, {status:400})
        let rechargeAmt = body.rechargeAmt
        if(!rechargeAmt)
            return NextResponse.json({"msg" : "No recharge amount"}, {status:400})
        user.walletAmt = user.walletAmt + rechargeAmt
        await user.save()

        return NextResponse.json({'amt' : user.walletAmt}, {status:200})
    } catch (e:any) {
        return NextResponse.json({"error" : e.message},{status:500})
    }
}