//
//  ViewController.swift
//  memoApp
//
//  Created by ssyb on 2024/4/15.
//

import UIKit

class EditViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {
    
    var memo: Memo?
    
    @IBOutlet weak var memoContent: UITextView!
    @IBOutlet weak var memoTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        memoTitle.layer.borderColor=UIColor.lightGray.cgColor
        memoContent.layer.borderColor=UIColor.lightGray.cgColor
        
        memoTitle.delegate=self
        memoContent.delegate=self
        
        memoContent.isEditable=true
        
        memoTitle.text=memo?.getTitle()
        memoContent.text=memo?.getContent()
    }
    @IBAction func saveALL(_ sender: Any) {
        memoContent.reloadInputViews()
        memoTitle.reloadInputViews()
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if let editText=textView.text
        {
            memo?.editContent(editText)
            textView.reloadInputViews()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let editRText=textField.text
        {
            memo?.editTitle(editRText)
            textField.reloadInputViews()
        }
    }
    
    
    
}

