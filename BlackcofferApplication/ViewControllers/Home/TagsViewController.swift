//
//  TagsViewController.swift
//  BlackcofferApplication
//
//  Created by RITIKA VERMA on 21/03/21.
//

import UIKit

class TagsViewController: UIViewController {

    @IBOutlet weak var SearchTags: UILabel!
    @IBOutlet weak var tag1: UIView!
    @IBOutlet weak var tag2: UIView!
    @IBOutlet weak var tag3: UIView!
    @IBOutlet weak var tag4: UIView!
    @IBOutlet weak var BroadcastBtn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setups()
        // Do any additional setup after loading the view.
    }
    

    
    func setups(){
//        SearchTags.layer.borderColor = UIColor.init(red: 42, green: 86, blue: 150, alpha: 1).cgColor
        SearchTags.layer.borderColor = UIColor.blue.cgColor
        SearchTags.layer.borderWidth = 2
        
        tag1.layer.borderColor = UIColor.systemGray5.cgColor
        tag1.layer.borderWidth = 2
        
        tag2.layer.borderColor = UIColor.systemGray5.cgColor
        tag2.layer.borderWidth = 2
        
        tag3.layer.borderColor = UIColor.systemGray5.cgColor
        tag3.layer.borderWidth = 2
        
        tag4.layer.borderColor = UIColor.systemGray5.cgColor
        tag4.layer.borderWidth = 2
        

    }

}
