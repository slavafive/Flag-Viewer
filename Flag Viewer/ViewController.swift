//
//  ViewController.swift
//  Flag Viewer
//
//  Created by Вячеслав Ефимов on 03.01.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.0647065416, green: 0.3385555148, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        
        title = "Countries"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png") {
                pictures.append(item)
                countries.append(String(item.dropLast(4)))
            }
        }
        
        print(countries)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dvc = storyboard?.instantiateViewController(identifier: "detailController") as? DetailViewController {
            dvc.picture = pictures[indexPath.row]
            dvc.country = countries[indexPath.row]
            navigationController?.pushViewController(dvc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

