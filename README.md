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
 - 이벤트 종류
 사용자, 결제관련 이벤트를 추적합니다.
```
ORDER, SHOPPINGCART, ORDERCANCEL, 
SGININ, SIGNUP, ACCOUNTDELETED, ACCOUNTMODIFIED
```

### 5.1 결제 이벤트
- 사용자의 결제 이벤트를 추적합니다.
- 결제 방법 : 카드 - CREDICTCARD
            계좌이체 - BANKTRANSFER
            핸드폰 결제 - MOBILEPAYMENT
            기타 - ETC
            
* 결제 추적  
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

*장바구니 담기
```swift
import Mobtune

let cartData = CartData(cartID: "카트 아이디",
                        products: [ProductItem])
Mobtune.addEvent(eventType: .SHOPPINGCART, param: cartData)
```

*주문 취소
```swift
import Mobtune

let cancelData = OrderCancelData(orderID: "주문 ID",
                                 method: 결제 방법,
                                 price: "주문 취소 금액",
                                 products: [ProductItem])
Mobtune.addEvent(eventType: .ORDERCANCEL, param: cancelData)
```


### 5.2 사용자 이벤트
- 사용자의 로그인, 회원가입, 탈퇴등의 이벤트를 추적합니다.
  
*로그인 이벤트
- 사용자의 로그인 이벤트 추적
```swift
import Mobtune

let data = UserAccountData(userID: "사용자 ID")
Mobtune.addEvent(eventType: .SIGNIN, param: data)
```

*회원 탈퇴 이벤트
- 사용자의 회원 탈퇴 이벤트 추적
```swift
import Mobtune

let data = UserAccountData(userID: "사용자 ID")
Mobtune.addEvent(eventType: .ACCOUNTDELETED, param: data)
```

*회원 가입 / 수정 이벤트
- 사용자의 회원 가입 / 수정 이벤트 추적
- 성별 : 남성 - M
        여성 - F
        기타 - N
- 생일 : 8자리 yyyyMMdd
- 핸드폰번호 : 온리 숫자타입        
- 결혼 여부 : Y/N        
```swift
import Mobtune

let info = UserInfoData(userID: "사용자 ID",
                        userName: "사용자 이름",
                        nickName: "닉네임",
                        gender: "F/M/N",
                        birth: "yyyyMMdd",
                        phoneNo: "01012345678",
                        email: "사용자 이메일",
                        address: "주소",
                        marry: "Y/N")
        
if type == .join{
    //회원가입
    Mobtune.addEvent(eventType: .SIGNUP, param: info)
}else if type == .modify {
    //회원 정보 수정
    Mobtune.addEvent(eventType: .ACCOUNTMODIFIED, param: info)
}
```
