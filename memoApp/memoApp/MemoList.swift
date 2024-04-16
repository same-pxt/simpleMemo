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
    let persistentContainer : NSPersistentContainer
    private var memos:[MemoModel]
    init()
    {
        lazy var persistentContainer:NSPersistentContainer={
            let container = NSPersistentContainer(name : "memoModel")
            container.loadPersistentStores(completionHandler: { (storeDescription,error) in
                if let error = error as NSError?{
                    fatalError("Unresolved eero \(error),\(error.userInfo)")
                }})
                    return container;
        }()
        self.persistentContainer=persistentContainer
        memos=[]
    }
    
    func addMemo(_ title:String,content:String)
    {
        let newMemo = MemoModel(context: persistentContainer.viewContext)
        newMemo.title = title
        newMemo.content = content
        do
        {
            try persistentContainer.viewContext.save()
        }
        catch{
            print("failed to save")
        }
    }
    
    func loadMemos(){
        let fetchRequest : NSFetchRequest<MemoModel> = MemoModel.fetchRequest()
        do{
            memos = try persistentContainer.viewContext.fetch(fetchRequest)
        }catch
        {
            fatalError("failed to fetch memos: \(error)")
        }
    }
    
    func deleteMemos(at index :Int){
        let memoToDelete = memos[index]
        persistentContainer.viewContext.delete(memoToDelete)
        memos.remove(at: index)
        
        do
        {
            try persistentContainer.viewContext.save()
        }
        catch{
            print("failed to save")
        }
    }
    
    func getSize()->Int
    {
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MemoModel")
        
        do
        {
            let count = try persistentContainer.viewContext.count(for: fetchRequest)
            return count
        }
        catch
        {
            print("Error \(error)")
            return 0;
        }
    }
    func getList()->[MemoModel]
    {
        return memos
    }
    
    func saveall()
    {
        do
        {
            try persistentContainer.viewContext.save()
        }
        catch
        {
            fatalError("fail to save")
        }
    }
}
