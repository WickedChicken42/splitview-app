//
//  MasterViewController.swift
//  splitview-app
//
//  Created by James Ullom on 9/26/18.
//  Copyright © 2018 Hammer of the Gods Software. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {

                let controller = (segue.destination as! UINavigationController).topViewController as! ImagePresentationVC
                controller.image = imageArray[indexPath.row]
                
                // Shows the full screen button in the detail screen
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Pulling values from our static data
        cell.backgroundColor = colorsArray[indexPath.row]
        cell.textLabel!.text = namesArray[indexPath.row].description

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

    }

    // Dynamically sizing the row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let navBarHeight = navigationController?.navigationBar.frame.height {
            return (tableView.frame.height - navBarHeight) / CGFloat(imageArray.count)
        } else {
            return tableView.frame.height / CGFloat(imageArray.count)
        }

    }
}

