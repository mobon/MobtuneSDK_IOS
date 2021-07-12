# MobtuneSDK_IOS

Mobtune SDK 를 이용하여 통해 고객 흐름 파악 및 이용자 분석, 측정 데이터 제공 합니다.

# Mobtune Android SDK Release History
 |version|Description|
|---|:---:|
|0.9.0|최초 라이브러리 버전|

## 개발환경
- 최소 SDK Version : iOS13
- Build Tool : XCODE 

## 1. Mobtune SDK 기본설정

- project build.gradle 에 mavenCentral() 을 추가합니다.

```XML
allprojects {
    repositories {
        google()
        jcenter()
        mavenCentral() //add
    }
}
```

- app build.gradle 에 mobtuneSDK 라이브러리를 추가합니다.
```XML
dependencies {
  implementation fileTree(dir: 'libs', include: ['*.jar'])
  implementation 'com.android.installreferrer:installreferrer:1.2' // add library
  implementation 'io.github.mobon:mobtuneSDK:0.9.0' // add library
}
```


## 2. Mobtune SDK 선언
 - Application 에 sdk 초기화와 ActivityLifecycleCallback을 등록합니다.

```java
public class MyApplication extends Application {

    @Override public void onCreate() {
        super.onCreate();

        MobtuneSDK.init(this,"YOUR_APP_KEY"); // 등록한 app key를 넣어주세요.
        if (Build.VERSION.SDK_INT >= 14) {
            registerActivityLifecycleCallbacks(new MobtuneLifecycleCallbacks());
        }
    }
}

```

## 3.Hybrid App
 - Hybrid 앱의 경우 Mobtune의 config를 사용해야 더욱 정확한 사용자 추적을 할 수 있습니다.
 
 ```swift
 let contentController = WKUserContentController()
 let config = Mobtune.getConfiguration()
 config.userContentController = contentController
 
 contentWArea = WKWebView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: view.frame.size.width,
                                        height: view.frame.size.height),
                          configuration: config)
 contentWArea.navigationDelegate = self
 contentWArea.uiDelegate = self
 view.addSubview(contentWArea)
```
