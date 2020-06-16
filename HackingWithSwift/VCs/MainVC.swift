//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    // MARK: - Properties
    var pictures = [String]()

    
    // MARK: - App cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
    }
    
    // Set the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    // Create the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    // Cell clicked
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailVC {
            vc.imageName = pictures[indexPath.row]
            vc.imageNumber = indexPath.row + 1
            vc.arrayCount = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    //MARK: - Methods
    
    
}
