//
//  ViewController.swift
//  customCell
//
//  Created by Sebastian Hette on 23.09.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let par = parser();
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 100;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        if par.bodies.count==0 {
            cell.myLabel.text="Scroll up and down to refresh";
        }
        else{
            var out = "Title : ";
            out.append(par.titles[indexPath.hashValue%par.titles.count]);
            out.append("\n\nBody : ");
            out.append(par.bodies[indexPath.hashValue%par.bodies.count]);
            cell.myLabel.text=out;
        }
        return (cell)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

