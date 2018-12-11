//
//  Traveling_ArshadatVM.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-11-04.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import  UIKit
import ObjectMapper
class  Traveling_ArshadatVM {
    
    var allInstructions :[InstructionsModel] = [];
    var customColor  =   AddHEXColor();
    
    func instractionCount () -> Int {
        return allInstructions.count
    }
    
    
    func getItemOfInstruactions (index : Int) -> InstructionsModel {
        return allInstructions[index]
    }
    
    
    // prepare tabs
    func prepareBtnAfterClick(activeBtn :  UIButton , disActiveBtn :  UIButton , activeImage :  String ,  disActiveImage :  String , activeTextColor : UInt , disActiveTextColor : UInt) {
        activeBtn.setImage(UIImage(named: activeImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        disActiveBtn.setImage(UIImage(named: disActiveImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        disActiveBtn.setTitleColor( customColor.UIColorFromRGB(rgbValue: activeTextColor), for:.normal )
        activeBtn.setTitleColor( customColor.UIColorFromRGB(rgbValue: disActiveTextColor), for:.normal )
        
    }
    
    
    func loadAllInstructions ( type :  Int , instructionData : @escaping (_ allItems :[InstructionsModel]) -> () ) {
        
        switch type {
        case 1:
            allInstructions = [InstructionsModel(titleValue:"صلاحية جواز السفر",instructionValue:  "عند الرغبة في السفر علبك التأكد من سريان صلاحية جواز سفرك لمدة لا تقل عن ستة اشهر وان يكون جميع أفراد أسرتك الذين لا يحملون جوازات منفردة مضافين في نفس الجواز ويكون سفرهم برفقة صاحب الجواز الصادر باسمه."),InstructionsModel(titleValue:"لمراجعة الممثلية السعوية",instructionValue: " الاحتفاظ برقم السجل المدني لتسهيل الرجوع إليه عند الحاجة خاصة في حال مراجعة الممثلية السعودية لأي غرض كان ."),
                               InstructionsModel(titleValue:"قوانين تحكم الحصول علي التاأشيرات",instructionValue: "     هناك دول تطلب من قاصدها الحصول مسبقاً على تأشيرة دخول من ممثلياتها في الخارج لذا عليك الحصول على تلك التأشيرات قبل المغادرة وعند التقدم لإحدى الممثليات الأجنبية بطلب التأشيرات يجب مراعاة الدقة في تعبئة جميع نماذج طلب التأشيرات وان تكون اجاباتك على الاستفسارات متطابقة مع ما هو مدون في نموذج طلب التأشيرة، والتأكد من ان يشار الى عدد افراد عائلتك المضافين في نفس الجواز في التأشيرة الصادرة ."),InstructionsModel(titleValue:"حجوزاتك مع مكاتب مرخصة",instructionValue: "  احرص على التعامل في حجوزاتك الخاصة بالسفر والسكن والتنقلات مع مكاتب مرخصة حتى لا تقع ضحية النصب والاحتيال ."),InstructionsModel(titleValue:"حمل الاغذية",instructionValue: "إن بعض الدول تمنع دخول الاغذية والمعلبات لذا تجنب حملها بداخل امتعتك ، وللتعرف على قائمة الممنوعات والقيود في الدولة او الدول التي سيقصدها عليك الاستفسار عنها عن طريق ممثلياتها في المملكة او البحث عنها في شبكة المعلومات الدولية ."),InstructionsModel(titleValue:"المتعلقات الشخصية و الثمينة",instructionValue: "معرفة النظام المعمول به في الدولة فيما يخص ادخال النقد والقيود عليه والمجوهرات والمتعلقات الشخصية الثمينة ، ومن الأفضل عدم حمل مبالغ نقدية كبيرة ويستحسن استخدام بطاقات الائتمان ."),InstructionsModel(titleValue:"الاعمال التجارية",instructionValue: "إذا كانت اهداف زيارتك لقضاء بعض الاعمال التجارية فقبل الدخول في مفاوضات مع الشركات او الافراد عليك مراجعة الغرفة التجارية بالمملكة قبل سفرك، والاستعانة بالممثلية السعودية في البلد للتأكد من سلامة وضع تلك الشركات حتى لا تقع ضحية للغش والتزوير وعليك استشارة محامي قبل ابرام أي عقود ."),InstructionsModel(titleValue:"رحلات الصيد",instructionValue: "إن رحلات الصيد تستوجب معرفة أنظمة الصيد في الدول التي تقصدها وما يتبع ذلك من الحصول على رخصة لهذا الغرض من سلطات البلد المضيف ."),InstructionsModel(titleValue:"الحاسب الشخصي",instructionValue: "التأكد من ان جميع البرامج المحملة على الحاسب الشخصي هي برامج اصلية لان تحميل برامج مقلدة يعرض للعقوبة."),InstructionsModel(titleValue:"الزواج و الطلاق",instructionValue: "أهمية مراجعة الممثلية السعودية قبل الشروع بإجراءات الزواج في حالة الرغبة في الطلاق –لا سمح الله – تأكد من وقوع الطلاق بصفته الشرعية تجنباً لادعاءات مستقبلية بوجود أبناء ."),
                               InstructionsModel(titleValue: "المبالغ النقدية",instructionValue: "اصطحابك لمبالغ نقدية كبيرة قد يعرضك لا قدر الله لاحتمال السرقة او فقدانها، بإمكانك الاستعاضة من ذلك باستخدام الوسائل البديلة مثل( البطاقات الائتمانية، الشيكات السياحية)."),
                               InstructionsModel(titleValue: "تسجيل جواز  السفر و بيانات الرحلة",instructionValue: " بادر بالتسجيل في خدمة (تسجيل جواز السفر وبيانات الرحلة) علما بأنه يمكنك التسجيل فيها بعد الوصول إلي البلد الذي تقصده.")
                
            ]
            instructionData(allInstructions)
            break
            
        case 2:
      allInstructions = [InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "عند الوصول الي الدولة التي قصدتها يجب عليك تعبئة نماذج الدخول بكل دقة و الإجابة على استفسارات مسئولي جوازات الدخول والاجابة على قدر السؤال فقط ."),
                         InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "الافصاح بدقة لموظف الجمارك عند الوصول عن كل ما يوجد بداخل الامتعة وتذكر بان بعض الدول تحتم على القادم تسجيل ما لديه من مجوهرات ونقود وشيكات وغيرها من المتعلقات الشخصية إذا تجاوزت حد معين ."),
                         InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "احرص على الحصول عند الصرف على ايصال المبالغ التي يتم تحويلها الى عملة البلد لإبرازها عند المغادرة حتى لا تتعرض مجوهراتك ونقودك للمصادرة وكذلك ايصالات شراء المجوهرات والاشياء الثمينة ."),
                         InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "استفزاز اي شخص او اطلاق بعض التعليقات الحادة او اللاذعة قد يكون سببا للاعتداء عليك او ملاحقتك قضائيا"),
                         InstructionsModel(titleValue:"المحافظة علي اوراقك",instructionValue: "حافظ على جواز سفرك فهو وثيقة خاصة بك وتذاكر الطيران ومتعلقات الشخصية في اماكن امنة فعند وصولك لمقر اقامتك اطلب صندوق امانات وضعها فيه، وبادر بتسجيل جوازك لدى الممثلية السعودية ."),
                         InstructionsModel(titleValue:"قوانين بعض الدول",instructionValue: "تفرض قوانين بعض الدول تأشيرات دخول و تشترط عدد من المتطلبات منها التقديم قبل وقت كافي من موعد السفر و تتجبن السفر في اوقات السفر و العطلات الرسمية و الاجنبية (اعياد الميلاد و راس السنه) لان السفارة الاجنبية تشهد ضغطا في العمل بسبب تزايد عدد المتقدمين لطلب التأشيرات من السعوديين و المقيمون في المملكة"),
                         InstructionsModel(titleValue: "السفر الي دولة ثالثة",instructionValue: "علي الراغب في السفر الي دولة ثالثة التأكد من حصوله علي تأشيرة دخول من سفارات تلك الدول وهو في الممكة لان بعض السفارات الاجنبية لا تؤشر لغير المقيم في الدولة المضيفة"),
                         InstructionsModel(titleValue: "في حالة الوقوع في مشكلة",instructionValue: "في حالة وقوعك في أي مشكلة –لا سمح الله- اطلب الاتصال بمسؤول الممثلية السعودية في البلد المضيف."),
                         InstructionsModel(titleValue: "سجل جواز سفرك",instructionValue: "بادر بتسجيل جواز سفرك لدى الممثلية السعودية في البلد الذي تقصده.")
                         ]
   
                       instructionData(allInstructions)
            
            break
            
        case 3:
            allInstructions = [InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "ان تعاونك في تزويد الممثلية السعودية بعنوانك وأرقام هواتفك يسهل مهمة قيامها بالدور المطلوب منها في تقديم المساعدة لك عند وقوع أي حالات طوارئ لا سمح الله في البلد المضيف."),
                               InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "مراعاة اختلاف الثقافات وتجنب بعض التصرفات المألوفة بالنسبة للثقافة العربية والتي تكون غير مألوفة في الثقافات الاخرى ، كتقبيل الاطفال الاجانب او حضنهم او الحديث معهم دون سابق معرفة بهم او استخدام الة التصوير او الجوال لتصوير بعض الأشخاص دون موافقتهم."),
                               InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "تجنب محادثة الاطفال او من هم بسن المراهقة على شبكة الانترنت."),
                               InstructionsModel(titleValue:"عزيزي المواطن ، عزيزتي المواطنة",instructionValue: "إن أي خلاف عائلي يصل إلى سلطات الأمن يعاقب المتسبب فيه بالحق العام حتى ولو تنازل الطرف الآخر عن القضية لذا احرص على حصر الخلافات العائلية داخل إطار العائلة."),
                               
                               InstructionsModel(titleValue:"المحافظة علي اوراقك",instructionValue: "حافظ على جواز سفرك فهو وثيقة خاصة بك وتذاكر الطيران ومتعلقات الشخصية في اماكن امنة فعند وصولك لمقر اقامتك اطلب صندوق امانات وضعها فيه ، وبادر بتسجيل جوازك لدى الممثلية السعودية ."),
                               InstructionsModel(titleValue:"تجديد اوراقك",instructionValue: "الحرص تجديد رخص القيادة واوراق الاقامة قبل تاريخ انتهائها ، حتى لا تتعرض المسائلة القانونية ودفع غرامة وربما الإيقاف "),
                               InstructionsModel(titleValue:"استقدام ايدي عاملة",instructionValue: "إن بعض الدول تشترط الحصول على اذن مسبق قبل الشروع في إجراءات استقدام الايدي العاملة لذا احرص على مراجعة الممثلية السعودية في البلد المضيف لمعرفة ذلك."),
                               InstructionsModel(titleValue: "عند شراء عقار",instructionValue: "عند شراء عقار يجب على المواطن التأكد من الجهات المختصة من وجود سجل رسمي سليم وعدم وجود أي نزاع عليه أو موانع تعيق أو تمنع تسجيل العقار المراد شراؤه واطلاع محامي جيد على تلك الأوراق وعلى مسودة عقد البيع / الشراء والحصول منه على إفادة خطية بمناسبتها ويمكن الاستفادة من مرئيات السفارة ومحاميها."),
                               InstructionsModel(titleValue: "عند الرغبة في اعطاء توكيل",instructionValue: "عند الرغبة في اعطاء توكيل لفرد او مؤسسة او محامي في الخارج ننصحك ان يكون التوكيل قاصرا على الموضوع ذي صلة وان لا يكون توكيلا عاما ويوضح به رقم القضية وموضوعها وان لا يعطي الوكيل حق توكيل الغير او الدخول في تسوية والتصالح او التنازل وابراء الذمة دون الرجوع للموكل والحصول منه على موافقة خطية مسبقة ومصدقة رسميا من الجهات ذات الاختصاص حتى لا تقع ضحية الاستغلال ."),
                               InstructionsModel(titleValue: "قوانين لسلامتك",instructionValue: "عدم السماح لأجهزة الامن بتفتيش المسكن دون وجود اذن بالتفتيش من وكيل النيابة المختص او المحكمة او السلطات المختصة ."),
                               InstructionsModel(titleValue: "قوانين لسلامتك",instructionValue: "التزام الصمت عند التحقيق او الاستجواب بشان أي قضية او اتهام إذا لم يكن حاضرا معك محامي وفي تلك الحالة الاصرار على وجود محامي يحضر التحقيق او الاستجواب والاستفادة الانظمة والقوانين المنظمة لذلك ."),
                               InstructionsModel(titleValue: "قوانين لسلامتك",instructionValue: "في حالة وجود طلب استدعاء من المحكمة يجب الالتزام بالحضور امام المحكمة مع المحامي في الموعد المحدد تجنبا لصدور حكم غيابي."),
                               InstructionsModel(titleValue: "قوانين لسلامتك",instructionValue: "عدم الاحتفاظ او حمل الأوراق الثبوتية الخاصة باي شخص اخر أيا كان ، بما فيهم الزوجة تجنباً لتهمة حيازة أوراق ثبوتية لا تخصك شخصيا والاتهام بسرقتها، واهمية تسليم الجوازات والاوراق الثبوتية لمرافقيك سواء من عائلتك او مستخدميك او غيرهم ما عدا الأبناء القصر."),
                               
                               InstructionsModel(titleValue: "قوانين بعض الدول",instructionValue: "يجب التنبيه في حالة اصطحاب الخدم او السائقين المستقدمين بعقد عمل في المملكة الى انهم يخضعون لقانون الدول المضيفة والذي قد يسمح لهم بحيازة اوراقهم الثبوتية وبساعات محددة للعمل وفترة اجازة والحرية في الخروج من عند مخدومهم متى شاءوا بالإضافة الى إن الراتب يجب ان يتناسب مع الرواتب في الدولة المضيفة وان مخالف ذلك يعرض المخالف الى المساءلة القانونية والدخول في قضايا جنائية ومدنية.")
            
            ]
            
                               instructionData(allInstructions)
            
            // call out instructions
//            CallAPI().getData(url: GetAllOUtInstructions) { (result,code) in
//                print("status is \(code)")
//                switch result {
//                case .success(let _data):
//                    print("Success with JSON: \(_data))")
//
//                    if let DataObject = _data as? NSArray {
//                        for item in DataObject {
//                            print(item)
//                            let  instrusct = Mapper<InstructionsModel>().map(JSONObject: item)
//                             self.allInstructions.append(instrusct!)
//                        }
//                    }
//                    instructionData(self.allInstructions)
//
//                    break
//
//                case .failure(let error):
//                    print("Request failed with error: \(error)")
//                    instructionData(self.allInstructions)
//
//                    break
//
//                }
//
//            }
            break
            
        default:
            instructionData(self.allInstructions)

            break
        }
        
    }
   
    
}



