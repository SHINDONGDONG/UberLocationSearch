//
//  LocationManager.swift
//  UberLocationSearch
//
//  Created by 申民鐡 on 2022/01/21.
//

import Foundation
//Location을 사용 할 수 있게 임포트해준다.
import CoreLocation

//임의의 모델을 만들어줌.
struct Location {
    let title: String
    let coordinates: CLLocationCoordinate2D
}


                     //NSObject는 차차알아가자.
class LocationManager: NSObject {
    //항상 메모리에 띄어놓는다 LocationClass를
    static let shared = LocationManager()

    //텍스트를 입력하고 눌렀을 때 위치를 찾을 수 있게 String과 핸들러를 escaping 배열로 담아준다.
    public func findLocations(with query: String, completion: @escaping(([Location]) -> Void)){
       
        //현재위치를 알려줄 수 있는 지오코더 //실제 문자열을 다른위치로 변환함
        let geoCoder = CLGeocoder()
        
        //문자열을 지오코딩한다. 넘겨줄 수 있는 매개변수는 문자열
        //places = 장소표시와 선택적으로 에러를
        geoCoder.geocodeAddressString(query){ places, error in
            //잘못되었을 때 places에 에러를 nil을넣고 completion에 빈배열을넣는다.
            guard let places = places, error == nil else {
                completion([])
                return
            }
            
            //models를 만들어 장소를 특정한다.
            let models: [Location] = places.compactMap({ place in
                var name = ""
                
                //동네를 넣어주고 다 더해준다.
                if let locationName = place.name {
                    name += locationName
                }
                
                //도시를 넣어주고
                if let adminRegion = place.administrativeArea {
                    name += ", \(adminRegion)"
                }
                
                //구 를 넣어주고
                if let locality = place.locality {
                    name += ", \(locality)"
                }
                
                //나라를 넣어주고
                if let country = place.country {
                    name += ", \(country)"
                }
                
                print("\n\(place)\n\n")
                //result에 location 네임과 장소를 넣어주고 리턴해준다.)
                let result = Location(
                    title: name,
                    coordinates: place.location!.coordinate)
            return result
            })
            //location을 반환해주는 completion에 모델을 반환시켜준다.
            completion(models)
        }
    }
}
