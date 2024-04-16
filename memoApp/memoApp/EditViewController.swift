//
//  ViewController.swift
//  memoApp
//
//  Created by ssyb on 2024/4/15.
//

import UIKit

class EditViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {
    
    var memo: MemoModel?
    
    @IBOutlet weak var memoContent: UITextView!
    @IBOutlet weak var memoTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        memoTitle.layer.borderColor=UIColor.lightGray.cgColor
        memoContent.layer.borderColor=UIColor.lightGray.cgColor
        memoContent.layer.borderWidth=1.0//边框宽度
        memoContent.layer.cornerRadius=0.5  //边框圆角半径
        
        memoTitle.delegate=self
        memoContent.delegate=self
        
        memoContent.isEditable=true
        
        memoTitle.text=memo?.title
        memoContent.text=memo?.content
    }
    @IBAction func saveALL(_ sender: Any) {
        //刷新内容
        memoContent.reloadInputViews()
        memoTitle.reloadInputViews()
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        //编辑内容时及时跟新
        if let editText=textView.text
        {
            memo?.content = editText
            textView.reloadInputViews()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let editRText=textField.text
        {
            memo?.title=editRText
            textField.reloadInputViews()
        }
    }
    
    
    
}

