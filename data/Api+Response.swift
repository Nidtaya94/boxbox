//
//  Api+Response.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import Foundation

struct ServiceResponseData {
  
  struct Service {
    var imageURLString: String?
    var type: String?
    var title: String?
    var subtitle: String?
  }
  
  var data: [Service]? = [
    Service(imageURLString: nil,
            type: "hotel",
            title: "title",
            subtitle: "subtitle"),
    Service(imageURLString: nil,
            type: "beauty",
            title: "title",
            subtitle: "subtitle")
  ]
  
}


struct ServiceDetailResponse {
  
  struct HotelDetail {
    var detailTitle: String? = "รายละเอียด"
    var detail: String? = """
    - บรรยากาศห้อมล้อมด้วยธรรมชาติ
    - ห้องแอร์ส่วนตัว
    - ห้องเป็นอลูมิเนียมกระจก โปร่งโล่ง เห็น เพื่อนที่มาพักห้องข้างๆ น้องหมาไม่เครียด
    - ของแต่งห้องมีเตียงนอน ของเล่น ชามข้าว ผ้าปูที่นอนและเสื้อกันหนาวให้
    """
    var serviceTitle: String? = "บริการเสริม"
    var service: String? = """
    - อาหาร Royal Canin 2 มื้อ
    - มีแม่บ้านดูแลทำความสะอาด
    - มีพี่เลี้ยงพาวิ่งเล่นอิสระในสนามหญ้า 2-3 เวลา
    - ระหว่างวันมีพี่เลี้ยงเข้าห้องไปเล่นและเช็ค สุขภาพโดยรวมของน้องหมาทุกวัน
    """
  }
  
  struct Data {
    var hotelDetail: HotelDetail? = HotelDetail()
    var beautyDetail: HotelDetail? = HotelDetail()
  }
  
  var data: Data? = Data()
  
}

