import Link from 'next/link'
import React from 'react'

const ReportPage = ({rname, rauthor, rdesc, rtime}) => {
  return (
    <main>
        <Link href='/ReportStatus/[id]' as="/ReportStatus/123">

          <div>
            <div className='h-52 bg-gray-200 m-8 p-4 hover:border-black hover:bg-gray-300 rounded-lg'>
              <h1 className='font-bold text-2xl mb-4'>{rname}</h1>
              <p className='w-[900px] mb-4'>{rdesc}</p>
              <p className='font-bold text-lg'>{rauthor}</p>
              <h1 className='flex justify-end pr-12'>{rtime}</h1>
            </div>
          </div>
        </Link>
    </main>
  )
}

export default ReportPage