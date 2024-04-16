//
//  memo.swift
//  memoApp
//
//  Created by ssyb on 2024/4/15.
//

import Foundation
class Memo
{
    private var title:String
    private var content:String
    private let creatTime:Date
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
        self.creatTime = Date()
    }
    
    func getTitle()->String
    {
        return title
    }
    
    func getContent()->String
    {
        return content
    }
    
    func getTime()->Date
    {
        return creatTime
    }
    
    func editTitle(_ s:String)->Bool
    {
        self.title=s
        return true
    }
    func editContent(_ s:String)->Bool
    {
        self.content=s
        return true
    }
}
