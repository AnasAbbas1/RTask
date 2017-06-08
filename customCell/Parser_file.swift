//
//  File.swift
//  customCell
//
//  Created by Anas Abbas on 6/8/17.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import Foundation
class parser {
    var bodies: [String];
    var titles: [String];
    init() {
        self.bodies=[String]();
        self.titles=[String]();
        self.web();
    }
    func fix(){
        var c=0;
        for item in bodies {
            bodies[c]=item.replacingOccurrences(of: "\n", with: "\\");
            c+=1;
        }
    }
    func otax(){
        self.fix();
        for item in titles {
            print(item);
        }
        for item in bodies {
            print(item);
        }
    }
    func web() {
        let url = URL(string:"https://jsonplaceholder.typicode.com/posts");
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                        for element in myJson{
                            let d = element as? NSDictionary
                            self.titles.append(d?["title"] as! String);
                            self.bodies.append(d?["body"] as! String);
                        }
                    }
                    catch
                    {
                        print("Can't Parse\n");
                    }
                    self.otax();
                }
            }
        }
        task.resume()
    }
}

