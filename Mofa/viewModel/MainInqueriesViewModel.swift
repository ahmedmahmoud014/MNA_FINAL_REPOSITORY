//
//  MainInqueriesViewModel.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-07-30.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit

class MainInqueriesViewModel {
    
    
    func  assignDateToView (screenNumber : Int) -> MainInqueriesStruct {
        var mainInqueriesStruct = MainInqueriesStruct()
        
        if screenNumber == 1 {
            
            if InquerySingleTone().sharedInstance.firstFeildValue ==  "1111111111" {


         mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "requestType",languageType: "ar") ,allInQuertItems: [
            InqueryItems(title: BaseController().localizedString(forKey: "requestType",languageType: "ar"),value: "طلب زياره شخصيه ") ,
            InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue) ,
            InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٣١ مايو ٢٠١٧"),
            
            InqueryItems(title: BaseController().localizedString(forKey: "requestUserName",languageType: "ar"),value: "فهد محمد ") ,
            InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "سعودي") ,
            InqueryItems(title: BaseController().localizedString(forKey: "requestUserJob",languageType: "ar"),value: "مهندس") ,
            InqueryItems(title: BaseController().localizedString(forKey: "requestUserAddress",languageType: "ar"),value: "الرياض العليا السعوديه"),
            InqueryItems(title: BaseController().localizedString(forKey: "requestUserPhoneNumber",languageType: "ar"),value: "0096264653246"),
            InqueryItems(title: BaseController().localizedString(forKey: "requestUserRecord",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue),
            InqueryItems(title: BaseController().localizedString(forKey: "requestEndDate",languageType: "ar"),value: "٣١ مايو ٢٠١٩"),
            InqueryItems(title: BaseController().localizedString(forKey: "requestJobOwerName",languageType: "ar"),value: "ابراهيم محمود"),
            InqueryItems(title: BaseController().localizedString(forKey: "requestJobOwerRecord",languageType: "ar"),value: "٢٢٢٣٣٣٤٤٤٤"),
            InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: " زيارة شخصية")
            
            ],
                                                      
                                                      
            allRequestList: [AllInqueriesRequestStruct(requestName: "سونا بنساسي ",requestEntryNumber: "١٤ مرة",requestDuration: "٢٠ يوم",allData: [
                
                InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value: "122222334456789") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value:"سونا بنساسي ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "سعودي"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestReligion",languageType: "ar"),value: "مسلم") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestWorkPlace",languageType: "ar"),value: "مكة") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestJobType",languageType: "ar"),value: "مهندس") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestAge",languageType: "ar"),value: "٣٣"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestRelation",languageType: "ar"),value: "مهندس صيانه"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "الرياض"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٣ مرات"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٤ ايام"),
                
                ]),AllInqueriesRequestStruct(requestName: "ريجي كولتشيني ",requestEntryNumber: "٣ مرات",requestDuration: "٤٠ يوم",allData: [
                    
                    InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value: "١٢٢٣٤٥٦٧٨٩٨٧") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "عدنان  بن سلمان") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "سعودي"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestReligion",languageType: "ar"),value: "مسلم") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestWorkPlace",languageType: "ar"),value: "المدينة") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestJobType",languageType: "ar"),value: "طبيب") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestAge",languageType: "ar"),value: "٤٠"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestRelation",languageType: "ar"),value: "دكتور جراحه عامه "),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "القاهرة"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر "),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٢٤ مرة"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٤٠ يوم"),
                    ])])
            }
            else if InquerySingleTone().sharedInstance.firstFeildValue ==  "2222222222" {
                
                
                mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "requestType",languageType: "ar") ,allInQuertItems: [
                    InqueryItems(title: BaseController().localizedString(forKey: "requestType",languageType: "ar"),value: "طلب زياره شخصيه ") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue) ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٣١ مايو ٢٠١٧"),
                    
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserName",languageType: "ar"),value: "فهد محمد ") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "سعودي") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserJob",languageType: "ar"),value: "مهندس") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserAddress",languageType: "ar"),value: "الرياض العليا السعوديه"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserPhoneNumber",languageType: "ar"),value: "0096264653246"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserRecord",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestEndDate",languageType: "ar"),value: "٣١ مايو ٢٠١٩"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestJobOwerName",languageType: "ar"),value: "ابراهيم محمود"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestJobOwerRecord",languageType: "ar"),value: "٢٢٢٣٣٣٤٤٤٤"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: " زيارة شخصية")
                    
                    ],   allRequestList: [AllInqueriesRequestStruct(requestName: "ريجي كولتشيني ",requestEntryNumber: "٣ مرات",requestDuration: "٤٠ يوم",allData: [
                                                                
                                                                InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value: "١٢٢٣٤٥٦٧٨٩٨٧") ,
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "عدنان  بن سلمان") ,
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "سعودي"),
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestReligion",languageType: "ar"),value: "مسلم") ,
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestWorkPlace",languageType: "ar"),value: "المدينة") ,
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestJobType",languageType: "ar"),value: "طبيب") ,
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestAge",languageType: "ar"),value: "٤٠"),
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestRelation",languageType: "ar"),value: "دكتور جراحه عامه "),
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "القاهرة"),
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر "),
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٢٤ مرة"),
                                                                InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٤٠ يوم"),
                                                                ])])
            }
            

            
            
        
        
        }
        else if  screenNumber == 2{
            
            if InquerySingleTone().sharedInstance.firstFeildValue ==  "1111111111" {

            
            mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaDate",languageType: "ar"),value: "٣١ مايو٢٠١٩"),
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "صالحة") ,
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaType",languageType: "ar"),value: "عمل خاص ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar"),value: "22222222222333333") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestVisaOwnerName",languageType: "ar"),value: "فهد محمد ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaRecordNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue),
                InqueryItems(title: BaseController().localizedString(forKey: "representationAddress",languageType: "ar"),value: "شارع الامير هاشم بن الحسين – مقابل مجمع تاج مول التجاري"),
                InqueryItems(title: BaseController().localizedString(forKey: "representationPhoneNumber",languageType: "ar"),value: "0096264653246"),

                
                ],allRequestList: [AllInqueriesRequestStruct(requestName: "سونا بنساسي ",requestEntryNumber: "١٤ مرة",requestDuration: "٢٠ يوم",allData: [
                                                        InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaType",languageType: "ar"),value: "سياحة") ,
                                                        InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value: "345685456939450") ,
                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "عدنان  بن سلمان") ,
                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "الرياض"),                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر"),
                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "سعودي"),

                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestRelation",languageType: "ar"),value: " ابن"),
                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٣ مرات"),
                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٤ ايام"),
                                                        
                                                        ])])
            }
            else if InquerySingleTone().sharedInstance.firstFeildValue ==  "2222222222" {
                
                
                
                mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue) ,
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaDate",languageType: "ar"),value: "٣١ مايو٢٠١٩"),
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "صالحة") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaType",languageType: "ar"),value: "عمل خاص ") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar"),value: "22222222222333333") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestVisaOwnerName",languageType: "ar"),value: "فهد محمد ") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaRecordNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue),
                    InqueryItems(title: BaseController().localizedString(forKey: "representationAddress",languageType: "ar"),value: "شارع الامير هاشم بن الحسين – مقابل مجمع تاج مول التجاري"),
                    InqueryItems(title: BaseController().localizedString(forKey: "representationPhoneNumber",languageType: "ar"),value: "0096264653246"),
                    
                    
                    ],allRequestList: [AllInqueriesRequestStruct(requestName: "سونا بنساسي ",requestEntryNumber: "١٤ مرة",requestDuration: "٢٠ يوم",allData: [
                        InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaType",languageType: "ar"),value: "سياحة") ,
                        InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value: "345685456939450") ,
                        InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "عدنان  بن سلمان") ,
                        InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "الرياض"),                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر"),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "سعودي"),
                        
                        InqueryItems(title: BaseController().localizedString(forKey: "requestRelation",languageType: "ar"),value: " ابن"),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٣ مرات"),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٤ ايام"),
                        
                        ]),AllInqueriesRequestStruct(requestName:  "ريجي كولتشيني ",requestEntryNumber: "٥ مرات ",requestDuration: "٣٠ يوم",allData: [
                            InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaType",languageType: "ar"),value: "زياره ") ,
                            InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value: "345685456939450") ,
                            InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value:"ابراهيم محمد اسماعيل ") ,
                            InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "دبي "),                                                        InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر"),
                            InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "اماراتي "),
                            
                            InqueryItems(title: BaseController().localizedString(forKey: "requestRelation",languageType: "ar"),value: " عم"),
                            InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٥ مرات"),
                            InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٣٠ يوم "),
                            
                            ])])
                
                
                
            }
        }
            
        else if  screenNumber == 4 {
            
            if InquerySingleTone().sharedInstance.firstFeildValue ==  "111111111111111" {
            
            mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: "عمل خاص ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: "333434343434") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٣١ مايو٢٠١٩"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestVisaOwnerName",languageType: "ar"),value: "فهد محمد ") ,
                
                InqueryItems(title: BaseController().localizedString(forKey: "invitationLetter",languageType: "ar"),value: "مرحب بكم ف الرياض ") ,

                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value:"في آنتظار التصديق "),
                InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "بنساسي") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٤ ايام"),                                                        InqueryItems(title: "\(BaseController().localizedString(forKey: "representationTiltle",languageType: "ar")) القاهرة",value: "القاهرة"),
                InqueryItems(title: BaseController().localizedString(forKey: "invitationNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue),
                InqueryItems(title: BaseController().localizedString(forKey: "invitationDate",languageType: "ar"),value: "٣٠ مايو ٢٠١٩"),
                InqueryItems(title: BaseController().localizedString(forKey: "companyOwnerName",languageType: "ar"),value: "سلمان بن عبد العزيز "),
                InqueryItems(title: BaseController().localizedString(forKey: "requestUserRecord",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue),
                InqueryItems(title: BaseController().localizedString(forKey: "tradeRecordId",languageType: "ar"),value: "٤٤٣٤٣٥٣٤٣٤٣"),
                InqueryItems(title: BaseController().localizedString(forKey: "companyFeild",languageType: "ar"),value: "تركيبات "),
                InqueryItems(title: BaseController().localizedString(forKey: "companyAddress",languageType: "ar"),value: "الرياض العليا شارع الوليد رقم ١٠ "),
                InqueryItems(title: BaseController().localizedString(forKey: "representationPhoneNumber",languageType: "ar"),value: "0096264653246"),
                InqueryItems(title: BaseController().localizedString(forKey: "companyType",languageType: "ar"),value: "صيانه "),
                InqueryItems(title: BaseController().localizedString(forKey: "phoneNumberValidation",languageType: "ar"),value: "0096264653246")
//                ,InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "٤٠ يوم"),
//                InqueryItems(title: BaseController().localizedString(forKey: "representationAddress",languageType: "ar"),value: "٤٠ يوم"),
//                InqueryItems(title: BaseController().localizedString(forKey: "representationPhoneNumber",languageType: "ar"),value: "٤٠ يوم"),
                
                
                ],allRequestList: [AllInqueriesRequestStruct(requestName:  "عهد ابراهيم ",requestEntryNumber: "١٤ مرة",requestDuration: "٢٠ يوم",allData: [
                    InqueryItems(title: BaseController().localizedString(forKey: "visitorName",languageType: "ar"),value: "عهد ابراهيم "),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserJob",languageType: "ar"),value: "شئون قانونية"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "اماراتيه"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "انثي"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "ابو ظبي "),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٤ ايام"),
                      InqueryItems(title: BaseController().localizedString(forKey: "durationPerDay",languageType: "ar"),value: "٤ ايام"),
                        InqueryItems(title: BaseController().localizedString(forKey: "workplaceName",languageType: "ar"),value: "شركة آل الخالد لتوريدات "),
                        InqueryItems(title: BaseController().localizedString(forKey: "workPlaceActive",languageType: "ar"),value: "توريدات"),
                          InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: "عمل "),
                          InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "صالحة")
                    ])])
                
            }
            else if InquerySingleTone().sharedInstance.firstFeildValue ==  "222222222222222" {
                
                
                mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                    InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: "عمل خاص ") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: "333434343434") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٣١ مايو٢٠١٩"),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestVisaOwnerName",languageType: "ar"),value: "فهد محمد ") ,
                    
                    InqueryItems(title: BaseController().localizedString(forKey: "invitationLetter",languageType: "ar"),value: "مرحب بكم ف الرياض ") ,
                    
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value:"في آنتظار التصديق "),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "بنساسي") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestVisitDuration",languageType: "ar"),value: "٤ ايام"),                                                        InqueryItems(title: "\(BaseController().localizedString(forKey: "representationTiltle",languageType: "ar")) القاهرة",value: "القاهرة"),
                    InqueryItems(title: BaseController().localizedString(forKey: "invitationNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue),
                    InqueryItems(title: BaseController().localizedString(forKey: "invitationDate",languageType: "ar"),value: "٣٠ مايو ٢٠١٩"),
                    InqueryItems(title: BaseController().localizedString(forKey: "companyOwnerName",languageType: "ar"),value: "سلمان بن عبد العزيز "),
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserRecord",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue),
                    InqueryItems(title: BaseController().localizedString(forKey: "tradeRecordId",languageType: "ar"),value: "٤٤٣٤٣٥٣٤٣٤٣"),
                    InqueryItems(title: BaseController().localizedString(forKey: "companyFeild",languageType: "ar"),value: "تركيبات "),
                    InqueryItems(title: BaseController().localizedString(forKey: "companyAddress",languageType: "ar"),value: "الرياض العليا شارع الوليد رقم ١٠ "),
                    InqueryItems(title: BaseController().localizedString(forKey: "representationPhoneNumber",languageType: "ar"),value: "0096264653246"),
                    InqueryItems(title: BaseController().localizedString(forKey: "companyType",languageType: "ar"),value: "صيانه "),
                    InqueryItems(title: BaseController().localizedString(forKey: "phoneNumberValidation",languageType: "ar"),value: "0096264653246")
                    //                ,InqueryItems(title: BaseController().localizedString(forKey: "requestName",languageType: "ar"),value: "٤٠ يوم"),
                    //                InqueryItems(title: BaseController().localizedString(forKey: "representationAddress",languageType: "ar"),value: "٤٠ يوم"),
                    //                InqueryItems(title: BaseController().localizedString(forKey: "representationPhoneNumber",languageType: "ar"),value: "٤٠ يوم"),
                    
                    
                    ],allRequestList: [AllInqueriesRequestStruct(requestName:  "سليمان  الحديدي عبد الغفور ",requestEntryNumber: "١٤ مرة",requestDuration: "٢٠ يوم",allData: [
                        InqueryItems(title: BaseController().localizedString(forKey: "visitorName",languageType: "ar"),value: "سليمان  الحديدي عبد الغفور "),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestUserJob",languageType: "ar"),value: "مهندس مكانيكا "),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestUserNationality",languageType: "ar"),value: "مصري "),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر "),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestFromWhere",languageType: "ar"),value: "القاهرة"),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٧ ايام"),
                        InqueryItems(title: BaseController().localizedString(forKey: "durationPerDay",languageType: "ar"),value: "٢ ايام"),
                        InqueryItems(title: BaseController().localizedString(forKey: "workplaceName",languageType: "ar"),value: "شركة آل الخالد لتوريدات "),
                        InqueryItems(title: BaseController().localizedString(forKey: "workPlaceActive",languageType: "ar"),value:"شركات  صيانه"),
                        InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: "عمل "),
                        InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "صالحة")
                        ])])
                
            }
        }
            
        else if  screenNumber == 5 {
            if InquerySingleTone().sharedInstance.firstFeildValue == "111111111111111" {
            mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٣١ مايو٢٠١٩") ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestUserName",languageType: "ar"),value: "محمد احمد"),
                InqueryItems(title: BaseController().localizedString(forKey: "passportNumberr",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "representation",languageType: "ar"),value: "ممثلية  السعوديه  في مومباي ") ,
                
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaType",languageType: "ar"),value:"سياحية")
                
              ,InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value:"صالحة"),
            InqueryItems(title: BaseController().localizedString(forKey: "feesPaid",languageType: "ar"),value: "٤٠ ريال"),
            InqueryItems(title: BaseController().localizedString(forKey: "repreentationIn",languageType: "ar"),value:  "الهند "),
                InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٢ مرة"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestEndDate",languageType: "ar"),value:"٥اغسطس ٢٠١٨"),
                InqueryItems(title: BaseController().localizedString(forKey: "barthDatePlace",languageType: "ar"),value: "مومباي الهند "),

                InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: "حج"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestOrginazation",languageType: "ar"),value:"القضاء"),
                InqueryItems(title: BaseController().localizedString(forKey: "birthDate",languageType: "ar"),value: "٢ مارس ١٩٤٥"),
                InqueryItems(title: BaseController().localizedString(forKey: "currentNationality",languageType: "ar"),value: "هندي"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestUserJob",languageType: "ar"),value: "مهندس ")

                
                ],allRequestList: [])
            
        }
            else if InquerySingleTone().sharedInstance.firstFeildValue ==  "222222222222222" {
                mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                    InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue) ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٣١ ابريل ٢٠٢٢") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestUserName",languageType: "ar"),value: "محمد ابراهيم "),
                    InqueryItems(title: BaseController().localizedString(forKey: "passportNumberr",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue) ,
                    InqueryItems(title: BaseController().localizedString(forKey: "representation",languageType: "ar"),value: "ممثلية  السعوديه  في الخرطوم ") ,
                    
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaType",languageType: "ar"),value:"سياحية")
                    
                    ,InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value:"صالحة"),
                     InqueryItems(title: BaseController().localizedString(forKey: "feesPaid",languageType: "ar"),value: "٤٠ ريال"),
                     InqueryItems(title: BaseController().localizedString(forKey: "repreentationIn",languageType: "ar"),value:  "السودان "),
                     InqueryItems(title: BaseController().localizedString(forKey: "requestEnterTimes",languageType: "ar"),value: "٢ مرة"),
                     InqueryItems(title: BaseController().localizedString(forKey: "requestEndDate",languageType: "ar"),value:"٥اغسطس ٢٠١٨"),
                     InqueryItems(title: BaseController().localizedString(forKey: "barthDatePlace",languageType: "ar"),value: "الخرطوم"),
                     
                     InqueryItems(title: BaseController().localizedString(forKey: "requestSex",languageType: "ar"),value: "ذكر"),
                     InqueryItems(title: BaseController().localizedString(forKey: "requestVisitAim",languageType: "ar"),value: "حج"),
                     InqueryItems(title: BaseController().localizedString(forKey: "requestOrginazation",languageType: "ar"),value:"الطب"),
                     InqueryItems(title: BaseController().localizedString(forKey: "birthDate",languageType: "ar"),value: "٢ مارس ١٩٤٥"),
                     InqueryItems(title: BaseController().localizedString(forKey: "currentNationality",languageType: "ar"),value: "سوداني "),
                     InqueryItems(title: BaseController().localizedString(forKey: "requestUserJob",languageType: "ar"),value: "طبيب  ")
                    
                    
                    ],allRequestList: [])
            }
        }
        
        else if  screenNumber == 6 {
            
            
            if InquerySingleTone().sharedInstance.firstFeildValue == "111111111111111" {

            mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value:InquerySingleTone().sharedInstance.firstFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٤ يوليو ٢٠١٩") ,
                InqueryItems(title: BaseController().localizedString(forKey: "opertatioNumber",languageType: "ar"),value: "٤٩٩٥٥٤٤٢٢"),
                InqueryItems(title: BaseController().localizedString(forKey: "representation",languageType: "ar"),value: "الاردن – عمان") ,
                InqueryItems(title: BaseController().localizedString(forKey: "recordNumberORPassport",languageType: "ar"),value:InquerySingleTone().sharedInstance.secondFeildValue)
                ,InqueryItems(title: BaseController().localizedString(forKey: "name",languageType: "ar"),value: "عدنان  الفيومي "),
                 InqueryItems(title: BaseController().localizedString(forKey: "topic",languageType: "ar"),value: "توقيع ع التاشيره "),
                 InqueryItems(title: BaseController().localizedString(forKey: "ProcedureType",languageType: "ar"),value: " تكامليه مع وزارة  العدل "),
                 InqueryItems(title: BaseController().localizedString(forKey: "feesPaid",languageType: "ar"),value:  "٤٠٠ ريال "),
                 InqueryItems(title: BaseController().localizedString(forKey: "ReceiptNumber",languageType: "ar"),value: "١٢١٢١٢١٢١٢"),
                 InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "تم التجديد "),
                 
                
                
                ],allRequestList: [])
            }
            else if InquerySingleTone().sharedInstance.firstFeildValue ==  "222222222222222" {
                mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                    InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value:InquerySingleTone().sharedInstance.firstFeildValue) ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "٥ ديسمبر ٢٠٢٠") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "opertatioNumber",languageType: "ar"),value: "٣٤٤٣٤٥٦٤٤٥"),
                    InqueryItems(title: BaseController().localizedString(forKey: "representation",languageType: "ar"),value: " الجزائر  -  الجزائر ") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "recordNumberORPassport",languageType: "ar"),value:InquerySingleTone().sharedInstance.secondFeildValue)
                    ,InqueryItems(title: BaseController().localizedString(forKey: "name",languageType: "ar"),value: "  محمد احمد عدنان  "),
                     InqueryItems(title: BaseController().localizedString(forKey: "topic",languageType: "ar"),value: "لم يتم التوقيع ع التاشيره "),
                     InqueryItems(title: BaseController().localizedString(forKey: "ProcedureType",languageType: "ar"),value: " تكامليه مع وزارة  العدل "),
                     InqueryItems(title: BaseController().localizedString(forKey: "feesPaid",languageType: "ar"),value:  "٤٠٠ ريال "),
                     InqueryItems(title: BaseController().localizedString(forKey: "ReceiptNumber",languageType: "ar"),value: "١٢١٢١٢١٢١٢"),
                     InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "تم التجديد "),
                     
                     
                     
                     ],allRequestList: [])
            
            }
            
        }
        else if  screenNumber == 8 ||  screenNumber == 7 {
            
            if InquerySingleTone().sharedInstance.firstFeildValue ==  "111111111111111" {
            mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "3 may 2021") ,
                InqueryItems(title: BaseController().localizedString(forKey: "name",languageType: "ar"),value: "  احمد العتيبي  "),
                InqueryItems(title: BaseController().localizedString(forKey: "representation",languageType: "ar"),value:" الجزائر -  الجزائر ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "تم التجديد "),
                InqueryItems(title: BaseController().localizedString(forKey: "remarks",languageType: "ar"),value: "تم التوقيع "),
                 ],allRequestList: [])
            
            } else if InquerySingleTone().sharedInstance.firstFeildValue ==  "2222222222" {
              
                mainInqueriesStruct = MainInqueriesStruct(pageTitle: BaseController().localizedString(forKey: "reqestVisaFile",languageType: "ar") ,allInQuertItems: [
                    InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: InquerySingleTone().sharedInstance.firstFeildValue) ,
                    InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value: "6 may 2017") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "name",languageType: "ar"),value: "ياسر  حمدان  ابراهيم  "),
                    InqueryItems(title: BaseController().localizedString(forKey: "representation",languageType: "ar"),value:"الاردن – عمان") ,
                    InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "منتهيه   "),
                    InqueryItems(title: BaseController().localizedString(forKey: "remarks",languageType: "ar"),value: "لم  يتم  التوقيع  لانها  منتهيه  "),
                    ],allRequestList: [])
            }
            else {
                
            }
            
            
        }
        return mainInqueriesStruct
    }
    
    
    func  getQuertForThirdStep () ->[InqueryItems]{
        
        //  remark for header of section pass value as empty
        var allItems : [InqueryItems]!
        
        print("\(InquerySingleTone().sharedInstance.testThirdStep)")
        
        
        if InquerySingleTone().sharedInstance.firstFeildValue == "1111111111"{
            allItems  =   [
                InqueryItems(title: BaseController().localizedString(forKey: "fristName",languageType: "ar"),value: "ابراهيم  سلمان ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "familyName",languageType: "ar"),value: " الراجحي ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value:InquerySingleTone().sharedInstance.secondFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "passportEndDate",languageType: "ar"),value:"٩ مارس ٢٠٢١"),
                InqueryItems(title: BaseController().localizedString(forKey: "visaDetailsData",languageType: "ar"),value: ""),
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaNumber",languageType: "ar"),value: "٣٢٣٢٤٣٥٤٥٥٤٤٥"),
                InqueryItems(title: BaseController().localizedString(forKey: "visaEndDate",languageType: "ar"),value: "٥ ابرايل ٢٠١٢ "),
                InqueryItems(title: BaseController().localizedString(forKey: "visaStatus",languageType: "ar"),value: "منتهية"),
                InqueryItems(title: BaseController().localizedString(forKey: "visaRequestDetailsDate",languageType: "ar"),value: ""),
                InqueryItems(title: BaseController().localizedString(forKey: "requestNumber",languageType: "ar"),value: "123454324565"),
                InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value:"٥ فبراير ٢٠٣٤"),
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "قيد المعالجه"),
            ]
            
        } else if InquerySingleTone().sharedInstance.firstFeildValue == "2222222222"{
            
            allItems  =   [
                InqueryItems(title: BaseController().localizedString(forKey: "fristName",languageType: "ar"),value: "ابراهيم  احمد ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "familyName",languageType: "ar"),value: "الحمد  ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value:InquerySingleTone().sharedInstance.secondFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "passportEndDate",languageType: "ar"),value:"٩ فبراير  ٢٠٢١"),
                InqueryItems(title: BaseController().localizedString(forKey: "visaDetailsData",languageType: "ar"),value: ""),
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaNumber",languageType: "ar"),value: "٤٥٣٤٣٤٥٦٧٨٤٥"),
                InqueryItems(title: BaseController().localizedString(forKey: "visaEndDate",languageType: "ar"),value: "٥ يونيو  ٢٠٢٢ "),
                InqueryItems(title: BaseController().localizedString(forKey: "visaStatus",languageType: "ar"),value: "صالحة")
            ]
            
        }else if InquerySingleTone().sharedInstance.firstFeildValue == "3333333333"{
            allItems  =   [
                InqueryItems(title: BaseController().localizedString(forKey: "fristName",languageType: "ar"),value: "الرفاعي  سلمان ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "familyName",languageType: "ar"),value: " الرفاعي ") ,
                InqueryItems(title: BaseController().localizedString(forKey: "passportId",languageType: "ar"),value: InquerySingleTone().sharedInstance.secondFeildValue) ,
                InqueryItems(title: BaseController().localizedString(forKey: "passportEndDate",languageType: "ar"),value:"٩ مارس ٢٠22"),
                InqueryItems(title: BaseController().localizedString(forKey: "visaDetailsData",languageType: "ar"),value: ""),
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaNumber",languageType: "ar"),value: "346545234323"),
                InqueryItems(title: BaseController().localizedString(forKey: "visaEndDate",languageType: "ar"),value: "٥ مايو ٢٠١٢ "),
                
                InqueryItems(title: BaseController().localizedString(forKey: "visaStatus",languageType: "ar"),value: "منتهية"),
               // InqueryItems(title: BaseController().localizedString(forKey: "visaRequestDetailsDate",languageType: "ar"),value: ""),
                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "لا  يوجد طلب "),
//                InqueryItems(title: BaseController().localizedString(forKey: "requestDate",languageType: "ar"),value:"تيست"),
//                InqueryItems(title: BaseController().localizedString(forKey: "reqestVisaStatus",languageType: "ar"),value: "r"),
            ]
        }else{
             allItems =  []
        }
        
        
        return allItems
    }
    
    
    func selectCellForSection(tableView: UITableView,indexPath: IndexPath) ->  InQueryListItemTableViewCell{
        var  cell : InQueryListItemTableViewCell!
        
        //  for row 1 in  drop  list in home page
        if (InqueriesTopDataViewController.showTopView == 0 ){
            cell = tableView.dequeueReusableCell(withIdentifier: "InQueryListItemTableViewCell", for: indexPath) as! InQueryListItemTableViewCell
            
            if indexPath.section ==  0
            {
                
                cell.addShadowR(roundBorder: 20, opacity: 0.1)
                cell.assignValues(inqueryItems: InqueriesTopDataViewController.allData[indexPath.section], show: true)
                
            }else if indexPath.section  ==  1 {
                cell.roundCorners([.topLeft,.topRight], radius: 20)
                cell.assignValues(inqueryItems: InqueriesTopDataViewController.allData[indexPath.section], show: false)
                
                
            }else if indexPath.section == InqueriesTopDataViewController.allData.count-1 {
                cell.roundCorners([.bottomLeft,.bottomRight], radius: 20)
                cell.assignValues(inqueryItems: InqueriesTopDataViewController.allData[indexPath.section], show: true)
                
                
            }else{
                cell.assignValues(inqueryItems: InqueriesTopDataViewController.allData[indexPath.section], show: false)
                
            }
            
        }
            
            
            //for test 
            
            //  for row 2 in  drop  list in home page
        else if  InqueriesTopDataViewController.showTopView == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "InQueryListItemTableViewCell", for: indexPath) as! InQueryListItemTableViewCell
            if indexPath.section == InqueriesTopDataViewController.allData.count-1{
                cell.roundCorners([.bottomLeft,.bottomRight], radius: 20)
                cell.assignValues(inqueryItems: InqueriesTopDataViewController.allData[indexPath.section], show: true)
                
                
            }else{
                cell.assignValues(inqueryItems: InqueriesTopDataViewController.allData[indexPath.section], show: false )
                
            }
            
            
        }
            
        else if  InqueriesTopDataViewController.showTopView == 2 {
            let item =  InqueriesTopDataViewController.allData[indexPath.section]
            
            
            
            
            if  !item.value.isEmpty
            {
            cell = tableView.dequeueReusableCell(withIdentifier: "InQueryListItemTableViewCell", for: indexPath) as! InQueryListItemTableViewCell
                  cell.assignValues(inqueryItems: item, show: false )

            }
            else
            {
                cell = tableView.dequeueReusableCell(withIdentifier: "InQueryListItemTableViewCell2", for: indexPath) as! InQueryListItemTableViewCell
                cell.addShadow(roundBorder: 20, opacity: 0.1)
                cell.assignValues(inqueryItems: item)

                
            }
            
            if indexPath.section == 0  ||  indexPath.section == 5 ||  indexPath.section == 9 {
                cell.roundCorners([.topLeft,.topRight], radius: 20)
            }
           else if indexPath.section == 7 || indexPath.section == 3  || indexPath.section == 11  {
                cell.roundCorners([.bottomLeft,.bottomRight], radius: 20)
                cell.assignValues(inqueryItems: item, show: true )

            } else if   indexPath.section == 8 {
                print("\(InqueriesTopDataViewController.allData.count)")
                if InqueriesTopDataViewController.allData.count == 9
                {
                    cell.addShadow(roundBorder: 20, opacity: 0.1)
                    cell.assignValues(inqueryItems: item,show: true,hideBullot: true)
                    
                }else{
                    cell.roundCorners([.topLeft,.topRight], radius: 20)

                }
            }
            
            

          
            
        }
        
        // cell.roundCorners(.topLeft, radius: 10)
        return cell
    }
    
    
    
    func checkFooterHeight(section : Int,showPage :  Int) -> CGFloat {
        
        
        // for first step  in main drop menu

        if showPage  ==  0{
        if section ==  0{
            return 25
        }
        else{
            
            return 0
        }
        }
            
    // for third step  in main drop menu
        else if showPage == 2 {
            
            if section  == 3  ||  section  == 4 || section == 7 || section == 8 {
                return  25
            }else {
                return 0
            }
            
        }
        else {return  0}
        
    }
    
    
}
