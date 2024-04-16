//
//  TableViewController.swift
//  memoApp
//
//  Created by ssyb on 2024/4/15.
//

import UIKit

class TableViewController: UITableViewController {
    var memolist:MemoList
    static var tiimes = 0

    required init?(coder aDecoder: NSCoder) {
        self.memolist=MemoList()
        
        
        super.init(coder: aDecoder)
        
        }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate=self
        memolist.loadMemos()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //每回返回的时候先将之前的内容存储，然后显示
        memolist.saveall()
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    @IBAction func addNewMemo(_ sender: Any) {
        memolist.addMemo("new memo", content: "")
        memolist.loadMemos()
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memolist.getSize()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //遍历加载每个cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text=memolist.getList()[indexPath.row].title
        cell.detailTextLabel?.text=memolist.getList()[indexPath.row].content
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //点击之行一个segue，在执行前会prepare和should。以此判断是否是正确的点击
        TableViewController.tiimes=TableViewController.tiimes+1
        print(TableViewController.tiimes)
        let selectMemo=memolist.getList()[indexPath.row]
        performSegue(withIdentifier: "editmemo", sender: selectMemo)
            
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="editmemo"
        {
            if let destVC = segue.destination as? EditViewController
            {
                if shouldPerformSegue(withIdentifier: segue.identifier ?? "", sender: sender)
                {
                    let selectmemo = sender as? MemoModel
                    destVC.memo=selectmemo
                }
            }
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if  let selectmemo = sender as? MemoModel
        {
            return true
        }
        return false
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            memolist.deleteMemos(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let cell=tableView.cellForRow(at: indexPath)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
