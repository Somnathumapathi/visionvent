export async function POST(req, res) {
    const data = JSON.parse(req.body)

    if(data.code != "q!w@e#r$t%y^u&")
        return res.status(400).json({"msg" : "No access"})
    
    // let userEx = await 
}