//
//  FirstViewController.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit
import Alamofire


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Table Rendering
    @IBOutlet weak var tableView: UITableView!
    
    var students: JSON?

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET,"http://localhost:3000/students")
            .response { (request, response, data, error) in
                //print(response)
                self.students = JSON(data: data!)
                print("the first reference", self.students![0]["name"]["first"].string)
                //print(error)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        print(students)
        //cell.name.text = students![indexPath.row]["name"]["first"].string
        //cell.email.text = students![indexPath.row]["email"].string
        return cell
    }


}

