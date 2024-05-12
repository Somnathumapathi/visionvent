import Link from 'next/link'
import React from 'react'

const researcherCardTab = ({content,desc,urltext}) => {
  return (
    <div>
      <Link href={`${urltext}`}>
        <div className="card ">
          <div className="content">
          <h1 className="front font-bold bg-i text-2xl">
              {content}
            </h1>
            <div className="back">
              <div className="flex justify-center items-center text-center font-bold text-xl">
                <h2>{desc}</h2>
              </div></div>
          </div>
        </div>
      </Link>
    </div>
  )
}

export default researcherCardTab