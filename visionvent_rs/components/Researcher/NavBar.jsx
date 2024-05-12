import React from 'react'
import Link from 'next/link'
import './navBar_r.css';

const NavBar = () => {
  return (
    <div>
      <nav className='w-full h-16 bg-black flex justify-around text-center items-center fixed top-0 left-0 text-white z-[50]'>
      <div className='flex gap-4 text-center items-center'>
      <Link href='/Researcher/DashBoard'><div className="image"></div></Link>
      <span className='font-bold text-2xl'><Link href='/Researcher/DashBoard'>VisionVent™</Link></span>
      </div>
        <ul className='flex gap-8 pl-36 text-white '>
          <li className='font-bold test p-4'><Link href='/Researcher/ViewReports'>Reports</Link></li>
          <li className='font-bold test p-4'><Link href='/Researcher/ResearcherTeam'>Team</Link></li>
        </ul>
        <button className='border-2 border-white px-4 py-2 font-bold rounded-lg hover:bg-[#4e4e4f] duration-300 '>Logout</button>
        
      </nav>
    </div>
  )
}

export default NavBar