//
//  InqueriesAllRequstesViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-29.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class InqueriesImportantDataViewController: BaseController , UITableViewDelegate,UITableViewDataSource{

    public static var allData  = [InqueryItems]();

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InQueryListItemTableViewCell1", for: indexPath) as! InQueryListItemTableViewCell
        //cell.assignValues(inqueryItems: InqueriesTopDataViewController.allData[indexPath.section], show: true)

        return cell
        
    }
    
    

    
}
