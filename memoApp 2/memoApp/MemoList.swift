//
//  memoList.swift
//  memoApp
//
//  Created by ssyb on 2024/4/15.
//

import Foundation
import CoreData
class MemoList
{
    private var memos:[Memo]
    private var size:Int
    init()
    {
        self.memos=[Memo(title: "welcome", content: "Input something")]
        self.size=1
    }
    
    func addMemo(_ memo:Memo)
    {
        self.memos.append(memo)
        self.size=self.size+1
    }
    
    func removeMemo(_ memo:Memo)
    {
        for(index,item)in memos.enumerated()
        {
            if item === memo{
                memos.remove(at: index)
                self.size=self.size-1
                break
            }
        }
    }
    
    func removeMemo(_ index:Int)
    {
        if index < size
        {
            memos.remove(at: index)
            size=size-1
        }
    }
    func getSize()->Int
    {
        return self.size;
    }
    func getList()->[Memo]
    {
        return memos
    }
}
