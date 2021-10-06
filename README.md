# MobtuneSDK_IOS

Mobtune SDK 를 이용하여 통해 고객 흐름 파악 및 이용자 분석, 측정 데이터 제공 합니다.

# Mobtune iOS SDK Release History
 |version|Description|
|---|:---:|
|0.9.0|최초 라이브러리 버전|
|0.9.13|Objective-C 프로젝트 대응|

## 개발환경
- 최소 SDK Version : iOS13
- Build Tool : XCODE 

## 1. Mobtune SDK 기본설정

- podFile에 Mobtune을 추가 합니다.

```
pod 'Mobtune_IOS'
```

## 2. info.plist 수정
- info.plist에 
```
Privacy - Tracking Usage Description
```
추가 합니다.



## 3. Mobtune SDK 선언
 - Application 에 SDK 초기화를 합니다.

```swift
import UIKit
import Mobtune

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Mobtune.configure(appKey: "Your_APP_KEY")
        
        return true
    }
}
```

## 4.Hybrid App
 - Hybrid 앱의 경우 Mobtune의 config를 사용해야 더욱 정확한 사용자 추적을 할 수 있습니다.
 
 ```swift
import Mobtune

let contentController = WKUserContentController()
let config = Mobtune.getConfiguration()
config.userContentController = contentController
        
let webView = WKWebView(frame: view.bounds, configuration: config)
view.addSubview(webView)
```


## 5.사용자 이벤트
 - 결제 이벤트
  - 사용자의 결제 이벤트를 추적합니다.
  - 아래 코드는 필수값들이니 빠진없이 채워주시기 바랍니다.
  
   ```swift
import Mobtune

let orderInfo = ProductInfo()
orderInfo.totalPrice = "결제금액"
orderInfo.paymentMethod = .결재 방법
orderInfo.orderId = "결제 코드"
orderInfo.productItems = []
for _ in 0..<2 {
    let item = ProductItem()
    item.quantity = 수량
    item.productName = "상품 이름"
    item.productId = "상품 코드"
    item.price = "상품 가격"
    orderInfo.productItems.append(item)
}

Mobtune.addEvent(eventType: .ORDER, param: orderInfo)
```
