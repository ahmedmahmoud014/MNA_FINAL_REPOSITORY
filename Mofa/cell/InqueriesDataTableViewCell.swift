//
//  InqueriesDataTableViewCell.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-30.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class InqueriesDataTableViewCell: UITableViewCell {

    @IBOutlet weak var reqestTitleLbl: UILabel!
    @IBOutlet weak var requestVisitNumberLbl: UILabel!
    @IBOutlet weak var requestDurationLbl: UILabel!
    @IBOutlet weak var requestVisitNumberTitleLbl: UILabel!
    @IBOutlet weak var requestDurationTitleLbl: UILabel!
    
    func asssignValues(allInqueriesRequestStruct : AllInqueriesRequestStruct){
        reqestTitleLbl.text  = allInqueriesRequestStruct.requestName
        requestVisitNumberLbl.text  = allInqueriesRequestStruct.requestEntryNumber
        requestDurationLbl.text  = allInqueriesRequestStruct.requestDuration
    }
}
