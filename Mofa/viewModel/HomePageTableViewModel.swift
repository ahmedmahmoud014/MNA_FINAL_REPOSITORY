//
//  HomePageViewModel.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-22.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
class HomePageTableViewModel {
    
    
   public var  headerTitle = [MainPageTableHeader(headerName: "الإستعلامات" ,imageName: "info_f",colaps: "plus"),
    MainPageTableHeader(headerName: "خدمات السعوديين في الخارج",imageName: "services_f",colaps: "plus"),
    MainPageTableHeader(headerName: "إرشادات",imageName: "help_f",colaps: "plus"),
    MainPageTableHeader(headerName: "عن التطبيق",imageName: "about_f",colaps: "plus")]
    
    
    func assignItemToArray() ->  [ExpandableTableRow]{
        return  [ ExpandableTableRow(status: false ,items:
            
            
            
            [""," تأشيرة مقدم إلى وزارة الخارجية"," تأشيرة صادرة من وزارة الخارجية","تأشيرة الخروج للسعوديين حاملي الجوازات الدبلوماسية و الخاصة","خطاب دعوة تجارية"," تأشيرة مقدم الى الممثلية"," خدمة إلكترونية مقدم للممثلية"," إصدار أو تجديد جوازات السفر أو تذاكر المرور للسعوديين في الخارج","مساعدة للسعوديين في الخارج"])
            
//            ["","الإستعلام عن طلب تأشيرة مقدم إلى وزارة الخارجية","الإستعلام عن تأشيرة صادرة من وزارة الخارجية","الإستعلام عن تأشيرة الخروج للسعوديين حامل الجوازات الدبلوماسية والخاصة","الإستعلام عن طلب خطاب دعوة تجارية"," الإستعلام عن طلب تأشيرة مقدم الى الممثلية","الإستعلام عن طلب خدمة إلكترونية","الإستعلام عن إصدار أو تجديد جوازات السفر أو تذاكر المرور للسعوديين في الخارج","الإستعلام عن طلب مساعدة للسعوديين في الخارج"])
            , ExpandableTableRow(status: false ,items: ["","تسجيل جواز السفر وبيانات الرحلة للسعوديين","طلب المساعدة للمواطنين السعوديين في الخارج","طلب تأشيرة خروج لحاملي الجوازات الدبلوماسية أو الخاصة"] )
            , ExpandableTableRow(status: false ,items: ["","سعودي مقيم خارج المملكة","مسافرون","تحديد أقرب ممثلية"])
            , ExpandableTableRow(status: false ,items: ["","نبذة عن التطبيق","مشاركة التطبيق","التسجيل في التطبيق","روابط مهمة"])
        ]

    }
    
    // read data from  Localizable file
    public  func localizedString(forKey key: String ,languageType:  String ) -> String {
        let path = Bundle.main.path(forResource: languageType , ofType: "lproj")
        let bundal  =  Bundle.init(path: path!)! as Bundle
        let result =  bundal.localizedString(forKey: key, value: nil, table: nil)
        return result
    }

    
    

//    ["","الإستعلام عن طلب تأشيرة مقدم إلى وزارة الخارجية","الإستعلام عن تأشيرة صادرة من وزارة الخارجية","الإستعلام عن تأشيرة الخروج للسعوديين حامل الجوازات الدبلوماسية والخاصة","الإستعلام عن طلب خطاب دعوة تجارية"," الإستعلام عن طلب تأشيرة مقدم الى الممثلية","الإستعلام عن طلب خدمة إلكترونية","الإستعلام عن إصدار أو تجديد جوازات السفر أو تذاكر المرور للسعوديين في الخارج","الإستعلام عن طلب مساعدة للسعوديين في الخارج"]

//
    
}
