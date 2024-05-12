import Link from 'next/link'
import React from 'react'
import './cardTab.css';

const CardTab = ({ content, desc}) => {
  return (
    <div>
      <Link href={`/${content}`}>
        <div className="card ">
          <div className="content">
          <h1 className="front font-bold bg-i text-3xl">
              {content}
            </h1>
            <div className="back">
              <div className="flex justify-center items-center text-center text-white font-bold text-xl">
                <h2>{desc}</h2>
              </div></div>
          </div>
        </div>
      </Link>
    </div>
  )
}

export default CardTab