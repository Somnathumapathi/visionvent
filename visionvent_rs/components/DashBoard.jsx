import React from 'react'
import AdminDash from './AdminDash'
import CardSelector from './CardSelector'
import NavBar from './NavBar'

const DashBoard = () => {
    return (
        <div>
            <NavBar />
            <div className="flex justify-evenly h-screen space">
            <div className="w-1/4"> <AdminDash /> </div>
            <div className="w-3/4"><CardSelector /></div>
        </div>
        </div>
    )
}

export default DashBoard