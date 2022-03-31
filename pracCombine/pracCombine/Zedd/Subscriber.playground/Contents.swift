import Cocoa
import Combine

//MARK: publisher의 값을 subscribe하는 방법
//class TestSubscriber: Subscriber {
//    typealias Input = String //subscriber가 받을 값의 종류
//    typealias Failure = Never //subscriber가 받을 수 있는 에러의 종류
//
//    //subscriber에게 publisher를 성공적으로 구독했음을 알리고 item을 요청
//    func receive(subscription: Subscription) {
//        print("퍼블리셔 구독 시작.")
//        //subscriber가 publisher에게 요청할 Item의 수를 지정할 수 있다.
//        subscription.request(.max(2)) //n개까지
//    }
//
//    //subscriber에게 publisher가 element를 생성했음을 알림
//    func receive(_ input: String) -> Subscribers.Demand {
//        print("publisher가 element 생성. \(input)")
//        return .none
//    }
//
//    //subscriber에게 publisher가 정상적으로 또는 오류로 publish를 완료했음을 알림
//    func receive(completion: Subscribers.Completion<Never>) {
//        print("완료", completion)
//    }
//
//}
//
////1. subscribe메서드 사용
//let publisher = ["Zedd", "Terror Jr", "Alan Walker", "Martin Garrix"].publisher
//publisher.subscribe(TestSubscriber())
//
///*
// 퍼블리셔 구독 시작.
// publisher가 element 생성. Zedd
// publisher가 element 생성. Terror Jr
// */


//2. sink()메서드 사용
class TestSubscriber: Subscriber {
    typealias Input = String //subscriber가 받을 값의 종류
    typealias Failure = Never //subscriber가 받을 수 있는 에러의 종류

    //1. subscriber에게 publisher를 성공적으로 구독했음을 알리고 item을 요청
    func receive(subscription: Subscription) {
        print("퍼블리셔 구독 시작.")
        //subscriber가 publisher에게 요청할 Item의 수를 지정할 수 있다.
        subscription.request(.max(1)) //n개까지
    }

    //2. subscriber에게 publisher가 element를 생성했음을 알림
    func receive(_ input: String) -> Subscribers.Demand {
        switch input {
        case "Zedd":
            return .max(2)
        default:
            return .none
        }
    }

    //3. subscriber에게 publisher가 정상적으로 또는 오류로 publish를 완료했음을 알림
    func receive(completion: Subscribers.Completion<Never>) {
        print("완료", completion)
    }

}

let 
