//
//  ViewController.swift
//  downloading Web content
//
//  Created by Lifoma Salaam on 1/30/16.
//  Copyright © 2016 Lifoma Salaam. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var urlinput: UITextField!
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        urlinput.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        urlinput.resignFirstResponder()
    }
    @IBAction func editingTextField(sender: UITextField) {
        if let input = urlinput.text{
            
            let URL = NSURL(string: "http://\(input)")!
            let task = NSURLSession.sharedSession().dataTaskWithURL(URL) { (data, response, error) -> Void in
                
                if let urlContent = data{
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.webView.loadHTMLString(String(webContent), baseURL: nil)
                        
                    })
                    
                }
                
            }
            
            task.resume()
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

