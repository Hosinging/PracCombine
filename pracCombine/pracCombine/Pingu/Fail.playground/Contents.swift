import Cocoa
import Combine

//MARK: 구현 예1
enum HoError: Error {
    case isNil
}

let fail = Fail<String, HoError>(error: .isNil)
fail
    .sink(receiveCompletion: { print("receive completion: \($0)")}, receiveValue: { print("receive value: \($0)")})

//receive completion: failure(__lldb_expr_24.HoError.isNil)

//MARK: Empty와 비슷하게 사용 예
let anyPublisher = [1, nil, 3].publisher
    .flatMap { value -> AnyPublisher<Int, HoError> in
        if let value = value {
            let just = Just(value).setFailureType(to: HoError.self)
            return just.eraseToAnyPublisher()
        } else {
            return Fail<Int, HoError>(error: .isNil).eraseToAnyPublisher()
        }
    }
    .sink(receiveCompletion: { print("Completion: \($0)")}, receiveValue: { print("value: \($0)")})
/*
 value: 1
 Completion: failure(__lldb_expr_26.HoError.isNil)
 */
