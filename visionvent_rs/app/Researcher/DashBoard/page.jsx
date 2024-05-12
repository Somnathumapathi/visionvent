import NavBar from '../../../components/Researcher/NavBar'
import React from 'react'
import ResearcherCard from '../../../components/Researcher/ResearcherCard'
import ResearcherDash from '../../../components/Researcher/ResearcherDash'

const page = () => {
    return (
        <div>
            <NavBar />
            <div className="flex justify-evenly h-screen space">
                <div className="w-1/4"><ResearcherDash/></div>
                <div className="w-3/4"><ResearcherCard /></div>
            </div>
        </div>
    )
}

export default page